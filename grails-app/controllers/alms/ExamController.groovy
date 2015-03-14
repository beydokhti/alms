package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class ExamController {

    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
    }

    def jsonList() {
        def columns = ['action', 'title','examStartTime','examEndTime','venue','event']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = Exam.count()
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
            def result = Exam.search("*${params.sSearch}*", options)
            list = result.results
        } else {
            def query = queryService.listQuery(params + [columns: columns])
            list = Exam.createCriteria().list(query)
        }
        def array = list.collect { Exam  it ->
            def action ="<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default:"Edit")}</a>"
            [action, it.title,it.examStartTime,it.examEndTime,it.venue,it.event.toString()]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }

    def create() {
        [examInstance: new Exam(params)]
    }

    def save() {
        def examInstance = new Exam(params)
        if (!examInstance.save(flush: true)) {
            render(view: "create", model: [examInstance: examInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'exam.label', default: 'Exam'), examInstance.id])
        redirect(action: "list")
    }

    def show(Long id) {
        def examInstance = Exam.get(id)
        if (!examInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "list")
            return
        }

        [examInstance: examInstance]
    }

    def edit(Long id) {
        def examInstance = Exam.get(id)
        if (!examInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "list")
            return
        }

        [examInstance: examInstance]
    }

    def update(Long id, Long version) {
        def examInstance = Exam.get(id)
        if (!examInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (examInstance.version > version) {
                examInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'exam.label', default: 'Exam')] as Object[],
                        "Another user has updated this Exam while you were editing")
                render(view: "edit", model: [id: examInstance.id])
                return
            }
        }

        examInstance.properties = params

        if (!examInstance.save(flush: true)) {
            render(view: "edit", model: [id: examInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'exam.label', default: 'Exam'), examInstance.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def examInstance = Exam.get(id)
        if (!examInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "list")
            return
        }

        try {
            examInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'exam.label', default: 'Exam'), id])
            redirect(action: "show", id: id)
        }
    }
}
