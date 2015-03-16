package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class CertificateController {

    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {

    }

    def jsonList() {
        def columns = ['action', 'cerType','cerTitle']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = Certificate.count()
        dataTableResponse.iTotalDisplayRecords = dataTableResponse.iTotalRecords
//        dataTableResponse.sEcho = Integer.valueOf(params.sEcho)
        def list

        if (params.containsKey('sSearch') &&  params.get('sSearch')) {
            def options = [:]
            options.max = Math.min(params.iDisplayLength ? params.int('iDisplayLength') : 10, 100)
            options.offset = params.int("iDisplayStart")
            def sortIndex = params.int("iSortCol_0")
            if (sortIndex > 0) {
                options.order = params["sSortDir_0"]
                options.sort = columns[sortIndex]
            }
            def result = Certificate.search("*${params.sSearch}*", options)
            list = result.results
        } else {
            def query = queryService.listQuery(params + [columns: columns])
            list = Certificate.createCriteria().list(query)
        }
        def array = list.collect { Certificate  it ->
            def action ="<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default:"Edit")}</a>"
            [action, it.cerType,it.cerTitle]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }

    def create() {
        [certificateInstance: new Certificate(params)]
    }

    def save() {
        def certificateInstance = new Certificate(params)
        if (!certificateInstance.save(flush: true)) {
            render(view: "create", model: [certificateInstance: certificateInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'certificate.label', default: 'Certificate'), certificateInstance.id])
        redirect(action: "list")
    }

    def show(Long id) {
        def certificateInstance = Certificate.get(id)
        if (!certificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'certificate.label', default: 'Certificate'), id])
            redirect(action: "list")
            return
        }

        [certificateInstance: certificateInstance]
    }

    def edit(Long id) {
        def certificateInstance = Certificate.get(id)
        if (!certificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'certificate.label', default: 'Certificate'), id])
            redirect(action: "list")
            return
        }

        [certificateInstance: certificateInstance]
    }

    def update(Long id, Long version) {
        def certificateInstance = Certificate.get(id)
        if (!certificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'certificate.label', default: 'Certificate'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (certificateInstance.version > version) {
                certificateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'certificate.label', default: 'Certificate')] as Object[],
                        "Another user has updated this Certificate while you were editing")
                render(view: "edit", model: [id: certificateInstance.id])
                return
            }
        }

        certificateInstance.properties = params

        if (!certificateInstance.save(flush: true)) {
            render(view: "edit", model: [id: certificateInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'certificate.label', default: 'Certificate'), certificateInstance.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def certificateInstance = Certificate.get(id)
        if (!certificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'certificate.label', default: 'Certificate'), id])
            redirect(action: "list")
            return
        }

        try {
            certificateInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'certificate.label', default: 'Certificate'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'certificate.label', default: 'Certificate'), id])
            redirect(action: "list")
        }
    }
}
