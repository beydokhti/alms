package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class OpenExamController {

    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [openExamInstanceList: OpenExam.list(params), openExamInstanceTotal: OpenExam.count()]
    }

    def jsonList() {
        def columns = ['action', 'title', 'examStartTime', 'examEndTime', 'venue', 'price', 'personCount']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = OpenExam.count()
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
            def result = OpenExam.search("*${params.sSearch}*", options)
            list = result.results
        } else {
            def query = queryService.listQuery(params + [columns: columns])
            list = OpenExam.createCriteria().list(query)
        }
        def array = list.collect { OpenExam it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>" +
                    "<a href='${g.createLink(controller: "openExamPolicy", action: "list", params: [id: it.id])}'>${message(code: "openExamPolicy.short", default: "Pol")}</a>"
            if (it.registredOpenExams.size() > 0)
                action = action + "<a href='${g.createLink(controller: "openExamResult", action: "list", params: [id: it.id])}'>${message(code: "openExamResult.short", default: "Res")}</a>"
            [action, it.title, it.examStartTime, it.examEndTime, it.venue, it.price, it.registredOpenExams.size()]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [openExamInstance: new OpenExam(params)]
    }

    def save() {
        def openExamInstance = new OpenExam(params)

        if (!openExamInstance.save(flush: true)) {
            render(view: "create", model: [openExamInstance: openExamInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'openExam.label', default: 'OpenExam'), openExamInstance.id])
        redirect(action: "list")
    }

    def show(Long id) {
        def openExamInstance = OpenExam.get(id)
        if (!openExamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "list")
            return
        }

        [openExamInstance: openExamInstance]
    }

    def edit(Long id) {
        def openExamInstance = OpenExam.get(id)
        if (!openExamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "list")
            return
        }

        [openExamInstance: openExamInstance]
    }

    def update(Long id, Long version) {
        def openExamInstance = OpenExam.get(id)
        if (!openExamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (openExamInstance.version > version) {
                openExamInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'openExam.label', default: 'OpenExam')] as Object[],
                        "Another user has updated this OpenExam while you were editing")
                render(view: "edit", model: [openExamInstance: openExamInstance])
                return
            }
        }

        openExamInstance.properties = params

        if (!openExamInstance.save(flush: true)) {
            render(view: "edit", model: [openExamInstance: openExamInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'openExam.label', default: 'OpenExam'), openExamInstance.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def openExamInstance = OpenExam.get(id)
        if (!openExamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "list")
            return
        }

        try {
            openExamInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "list")
        }
    }
}
