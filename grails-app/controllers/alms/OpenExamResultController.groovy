package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class OpenExamResultController {

    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        def openExamInstance = OpenExam.get(params.id)
        if (openExamInstance) {
            [openExamId: openExamInstance.id]
        }
    }

    def jsonList() {
        def columns = ['action', 'person', 'correctAnswer', 'wrongAnswer', 'finalScore']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = OpenExamResult.count()
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
            def result = OpenExamResult.search {
                must(term('$/openExamResult/openExam/id', params.long("openExamId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results

        } else {
            def query_criteria = {
                eq("openExam.id", params.long("openExamId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = OpenExamResult.createCriteria().list(query)
        }
        def array = list.collect { OpenExamResult it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            [action, it.person.name + " " + it.person.lastName, it.correctAnswer, it.wrongAnswer, it.finalScore]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        def openExamInstance = OpenExam.get(params.id)

        def personList = RegisteredOpenExam.findAllByOpenExam(openExamInstance).person.toList()
        [openExamResultInstance: new OpenExamResult(params), openExamId: params.id, personList: personList]
    }

    def save() {
        def openExamInstance = OpenExam.get(params.openExamId)
        if (openExamInstance) {
            def openExamResultInstance = new OpenExamResult(params)
            openExamInstance.addToOpenExamResults(openExamResultInstance)

            if (!openExamResultInstance.save(flush: true)) {
                render(view: "create", model: [openExamResultInstance: openExamResultInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'openExamResult.label', default: 'OpenExamResult'), openExamResultInstance.id])
            redirect(action: "list", id: openExamResultInstance.openExam.id)
        }
    }

    def show(Long id) {
        def openExamResultInstance = OpenExamResult.get(id)
        if (!openExamResultInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExamResult.label', default: 'OpenExamResult'), id])
            redirect(action: "list")
            return
        }

        [openExamResultInstance: openExamResultInstance]
    }

    def edit(Long id) {
        def openExamResultInstance = OpenExamResult.get(id)
        if (!openExamResultInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExamResult.label', default: 'OpenExamResult'), id])
//            redirect(action: "list")
            return
        }

        [openExamResultInstance: openExamResultInstance]
    }

    def update(Long id, Long version) {
        def openExamResultInstance = OpenExamResult.get(id)
        if (!openExamResultInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExamResult.label', default: 'OpenExamResult'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (openExamResultInstance.version > version) {
                openExamResultInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'openExamResult.label', default: 'OpenExamResult')] as Object[],
                        "Another user has updated this OpenExamResult while you were editing")
                render(view: "edit", model: [openExamResultInstance: openExamResultInstance])
                return
            }
        }

        openExamResultInstance.properties = params

        if (!openExamResultInstance.save(flush: true)) {
            render(view: "edit", model: [openExamResultInstance: openExamResultInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'openExamResult.label', default: 'OpenExamResult'), openExamResultInstance.id])
        redirect(action: "list", id: openExamResultInstance.openExam.id)
    }

    def delete(Long id) {
        def openExamResultInstance = OpenExamResult.get(id)
        if (!openExamResultInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExamResult.label', default: 'OpenExamResult'), id])
            redirect(action: "list")
            return
        }

        try {
            openExamResultInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'openExamResult.label', default: 'OpenExamResult'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'openExamResult.label', default: 'OpenExamResult'), id])
            redirect(action: "list", id: openExamResultInstance.openExam.id)
        }
    }
}
