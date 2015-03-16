package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class CurriculumController {

    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
    }

    def jsonList() {
        def columns = ['action', 'title', 'certificate', 'courseSummary']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = Curriculum.count()
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
            def result = Curriculum.search("*${params.sSearch}*", options)
            list = result.results
        } else {
            def query = queryService.listQuery(params + [columns: columns])
            list = Curriculum.createCriteria().list(query)
        }
        def array = list.collect { Curriculum it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            if (it.courses)
                action = action + "<a href='${g.createLink(controller: "term", action: "list", params: [id: it.id])}'>${message(code: "Term", default: "Term")}</a>"
            def courseSummary = ""
            it.courses.each { course ->
                courseSummary = course.title + "," + courseSummary
            }

            [action, it.title, it.certificate ? it.certificate.cerTitle : "", courseSummary]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }

    def create() {
        [curriculumInstance: new Curriculum(params)]
    }

    def save() {
        def curriculumInstance = new Curriculum(params)
        //todo mtb how add curriculum without  certificate in form? how select nothing?
        if (!curriculumInstance.save(flush: true)) {
            render(view: "create", model: [curriculumInstance: curriculumInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'curriculum.label', default: 'Curriculum'), curriculumInstance.id])
        redirect(action: "list")
    }

    def show(Long id) {
        def curriculumInstance = Curriculum.get(id)
        if (!curriculumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculum.label', default: 'Curriculum'), id])
            redirect(action: "list")
            return
        }

        [curriculumInstance: curriculumInstance]
    }

    def edit(Long id) {
        def curriculumInstance = Curriculum.get(id)
        if (!curriculumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculum.label', default: 'Curriculum'), id])
            redirect(action: "list")
            return
        }

        [curriculumInstance: curriculumInstance]
    }

    def update(Long id, Long version) {
        def curriculumInstance = Curriculum.get(id)
        if (!curriculumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculum.label', default: 'Curriculum'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (curriculumInstance.version > version) {
                curriculumInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'curriculum.label', default: 'Curriculum')] as Object[],
                        "Another user has updated this Curriculum while you were editing")
                render(view: "edit", model: [curriculumInstance: curriculumInstance])
                return
            }
        }

        curriculumInstance.properties = params

        //todo how remove event related to deleted course

        if (!curriculumInstance.save(flush: true)) {
            render(view: "edit", model: [curriculumInstance: curriculumInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'curriculum.label', default: 'Curriculum'), curriculumInstance.id])
        redirect(action: "list")
    }

    def delete(Long id) {
        def curriculumInstance = Curriculum.get(id)
        if (!curriculumInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curriculum.label', default: 'Curriculum'), id])
            redirect(action: "list")
            return
        }

        try {
            curriculumInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'curriculum.label', default: 'Curriculum'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'curriculum.label', default: 'Curriculum'), id])
            redirect(action: "show", id: id)
        }
    }
}
