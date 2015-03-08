package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class InstitutionController {

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
            def action ="<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"+
            "<a href='${g.createLink(controller: "institutionMember",action: "list", params: [id: it.id])}'>${message(code: "institutionMember", default: "Mem")}</a>"

            println(action)
            [action, it.name, it.nationalCode, it.registerNumber, it.address, it.fax.toString(),it.email]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }



    def create() {
        [institutionInstance: new Institution(params)]
    }

    def save() {
        def institutionInstance = new Institution(params)
        if (!institutionInstance.save(flush: true)) {
            render(view: "create", model: [institutionInstance: institutionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'institution.label', default: 'Institution'), institutionInstance.id])
        redirect(action: "list")
    }

    def show(Long id) {
        def institutionInstance = Institution.get(id)
        if (!institutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), id])
            redirect(action: "list")
            return
        }

        [institutionInstance: institutionInstance]
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
                render(view: "edit", model: [institutionInstance: institutionInstance])
                return
            }
        }

        institutionInstance.properties = params

        if (!institutionInstance.save(flush: true)) {
            render(view: "edit", model: [institutionInstance: institutionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'institution.label', default: 'Institution'), institutionInstance.id])
        redirect(action: "show")
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
