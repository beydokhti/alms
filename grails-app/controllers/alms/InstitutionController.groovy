package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class InstitutionController {

    def springSecurityService
    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
    }

    def jsonList() {
        def columns = ['action', 'name', 'nationalCode', 'registerNumber', 'address', 'fax', 'email']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = Institution.count()
        dataTableResponse.iTotalDisplayRecords = dataTableResponse.iTotalRecords
//        dataTableResponse.sEcho = Integer.valueOf(params.sEcho)

        def list

        if (params.containsKey('sSearch') && params.get('sSearch')) {
            def options = [:]
            options.max = Math.min(params.iDisplayLength ? params.int('iDisplayLength') : 10, 100)
            options.offset = params.int("iDisplayStart")
            def sortIndex = params.int("iSortCol_0")
            if (sortIndex > 0) {
                options.order = params["sSortDir_0"]
                options.sort = columns[sortIndex]
            }
            def result = Institution.search("*${params.sSearch}*", options)
            list = result.results
        } else {
            def query = queryService.listQuery(params + [columns: columns])
            list = Institution.createCriteria().list(query)
        }

        def array = list.collect { Institution it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>" +
                    "<a href='${g.createLink(controller: "institutionMember", action: "list", params: [id: it.id])}'>${message(code: "institutionMember", default: "Mem")}</a>"

            println(action)
            [action, it.name, it.nationalCode, it.registerNumber, it.address, it.fax.toString(), it.email]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [institutionInstance: new Institution(params)]
    }

    def save() {
        def institutionInstance = new Institution(params)
        if (!Broker.findByNationalCode(institutionInstance.nationalCode) && !User.findByUsername(institutionInstance.nationalCode)) {
            institutionInstance.username = institutionInstance.nationalCode
            //todo mtb change password
            institutionInstance.password = "password123"
            institutionInstance.enabled = true
            if (!institutionInstance.save(flush: true)) {
                render(view: "create", model: [institutionInstance: institutionInstance])
                return
            }

            def institutionRole = Role.findByAuthority("InstitutionRole")
            UserRole.findByUser(institutionInstance) ?: UserRole.create(institutionInstance, institutionRole)

            flash.message = message(code: 'default.created.message', args: [message(code: 'institution.label', default: 'Institution'), institutionInstance.id])
            redirect(action: "list")
        } else {
            flash.message = message(code: 'broker.unique.nationalCode.message', 'nationalCode should be unique')
            redirect(action: "create", id: institutionInstance.id)
        }

    }

    def show(Long id) {
        def institutionInstance = Institution.get(id)
        Boolean readOnly = false
        if (!institutionInstance) {
            readOnly = true
            def loginUser = springSecurityService.getPrincipal()
            if (loginUser instanceof GrailsUser) {
                def user = User.findByUsername(loginUser.username)

                institutionInstance = Institution.get(user.id)


                if (!institutionInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), id])
                    //todo mtb why go to list?
                    redirect(action: "list")
                    return
                }
            }
        }

        [institutionInstance: institutionInstance, readOnly: readOnly]
    }

    def edit(Long id) {
        def institutionInstance = Institution.get(id)
        if (!institutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), id])
            redirect(action: "list")
            return
        }

        [institutionInstance: institutionInstance]
    }

    def update(Long id, Long version) {
        def institutionInstance = Institution.get(id)
        if (!institutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (institutionInstance.version > version) {
                institutionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'institution.label', default: 'Institution')] as Object[],
                        "Another user has updated this Institution while you were editing")
                render(view: "edit", model: [id: institutionInstance.id])
                return
            }
        }

        institutionInstance.properties = params
        //todo mtb change username after change nationalCode?
        if (!Institution.findByNationalCode(institutionInstance.nationalCode)) {

            if (!institutionInstance.save(flush: true)) {
            render(view: "edit", model: [id: institutionInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'institution.label', default: 'Institution'), institutionInstance.id])
        redirect(action: "show")
        }else{
            flash.message = message(code: 'institution.unique.nationalCode.message','nationalCode should be unique')
            redirect(action: "edit", id: institutionInstance.id)
        }
    }

    def delete(Long id) {
        def institutionInstance = Institution.get(id)
        if (!institutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), id])
            redirect(action: "list")
            return
        }

        try {
            institutionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'institution.label', default: 'Institution'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'institution.label', default: 'Institution'), id])
            redirect(action: "show", id: id)
        }
    }
}
