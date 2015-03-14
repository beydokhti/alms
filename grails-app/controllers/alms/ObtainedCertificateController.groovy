package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class ObtainedCertificateController {

    def springSecurityService
    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        def personIns

        if (params.id) {
            personIns = Person.get(params.id)
        }else {
            def loginUser = springSecurityService.getPrincipal()
            if (loginUser instanceof GrailsUser) {
                def user = User.findByUsername(loginUser.username)

                personIns = Person.get(user.id)
                if (!personIns) {
                    return
                }
            }
        }

        if (personIns) {
            [personId: personIns.id]
        }
    }


    def jsonList() {
        println(params.toString())
        def columns = ['action', 'certificate','obtainedDate']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = ObtainedCertificate.count()
        dataTableResponse.iTotalDisplayRecords = dataTableResponse.iTotalRecords

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
            def result = ObtainedCertificate.search {
                must(term('$/ObtainedCertificate/person/id', params.long("personId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("person.id", params.long("personId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = ObtainedCertificate.createCriteria().list(query)
        }

        def array = list.collect { ObtainedCertificate it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            println(action)
            [action, it.certificate.toString(),it.obtainedDate.toString()]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [obtainedCertificateInstance: new ObtainedCertificate(params),personId:params.id]
    }

    def save() {
        println(params)
        def personInstance = Person.get(params.personId)
        //todo handle if brokerInstance is null
        if (personInstance) {

            def obtainedCertificateInstance = new ObtainedCertificate(params)
            personInstance.addToCertificates(obtainedCertificateInstance)
            if (!obtainedCertificateInstance.save(flush: true)) {
                render(view: "create", model: [obtainedCertificateInstance: obtainedCertificateInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), obtainedCertificateInstance.id])
            redirect(action: "list", id: personInstance.id)
        }
    }

    def show(Long id) {
        def obtainedCertificateInstance = ObtainedCertificate.get(id)
        if (!obtainedCertificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "list")
            return
        }

        [obtainedCertificateInstance: obtainedCertificateInstance]
    }

    def edit(Long id) {
        def obtainedCertificateInstance = ObtainedCertificate.get(id)
        if (!obtainedCertificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "list")
            return
        }

        [obtainedCertificateInstance: obtainedCertificateInstance]
    }

    def update(Long id, Long version) {
        def obtainedCertificateInstance = ObtainedCertificate.get(id)
        if (!obtainedCertificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (obtainedCertificateInstance.version > version) {
                obtainedCertificateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate')] as Object[],
                        "Another user has updated this ObtainedCertificate while you were editing")
                render(view: "edit", model: [id: obtainedCertificateInstance.id])
                return
            }
        }

        obtainedCertificateInstance.properties = params

        if (!obtainedCertificateInstance.save(flush: true)) {
            render(view: "edit", model: [id: obtainedCertificateInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), obtainedCertificateInstance.id])
        redirect(action: "list", id: obtainedCertificateInstance.person.id)
    }

    def delete(Long id) {
        def obtainedCertificateInstance = ObtainedCertificate.get(id)
        if (!obtainedCertificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "list")
            return
        }

        try {
            obtainedCertificateInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "show", id: id)
        }
    }

    def form() {
        def obtainedCer = new ObtainedCertificate()
        render(template: 'form', model: [obtainedCerInstance: obtainedCer])
    }

    def saveObtCer() {
        def person = Person.get(params.personId)
        ObtainedCertificate obtcer =new ObtainedCertificate(params)
        obtcer.save()
        person.addToCertificates(obtcer)
        person.save()

        render 0
        redirect(controller: "amendment", action: "list", params: [id: contract.id])
    }

}
