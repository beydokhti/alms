package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class TermController {

    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        def curriculumInstance=Curriculum.get(params.id)

        if (curriculumInstance){
            [curriculumId:curriculumInstance.id]
        }

    }

    def jsonList() {
        def columns = ['action','title','startDate','price']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = Term.count()
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
            def result = Term.search {
                must(term('$/Term/Curriculum/id', params.long("curriculumId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("curriculum.id", params.long("curriculumId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = Term.createCriteria().list(query)
        }

        def array = list.collect { Term it ->
            def action ="<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"+
            "<a href='${g.createLink(controller: "scheduler", action: "scheduler", id: it.id)}'>${message(code: "Scheduler", default: "Sch")}</a>"+
            "<a href='${g.createLink(controller: "discount", action: "list", id: it.id)}'>${message(code: "Discount", default: "Dis")}</a>"
            println(action)
            [action,it.title,it.startDate.toString(),it.price.toString()]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [termInstance: new Term(params),curriculumId: params.id]
    }

    def save() {
        def curriculumInstance=Curriculum.get(params.curriculumId)
        if (curriculumInstance) {
            def termInstance = new Term(params)
            curriculumInstance.addToTerms(termInstance)
            if (!termInstance.save(flush: true)) {
                render(view: "create", model: [termInstance: termInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'term.label', default: 'Term'), termInstance.id])
            redirect(action: "list", id: termInstance.curriculum.id)
        }
    }

    def show(Long id) {
        def termInstance = Term.get(id)
        if (!termInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'term.label', default: 'Term'), id])
            redirect(action: "list")
            return
        }

        [termInstance: termInstance]
    }

    def edit(Long id) {
        def termInstance = Term.get(id)
        if (!termInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'term.label', default: 'Term'), id])
            redirect(action: "list",id:termInstance.curriculum.id)
            return
        }

        [termInstance: termInstance]
    }

    def update(Long id, Long version) {
        def termInstance = Term.get(id)
        if (!termInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'term.label', default: 'Term'), id])
            redirect(action: "list",id:termInstance.curriculum.id)
            return
        }

        if (version != null) {
            if (termInstance.version > version) {
                termInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'term.label', default: 'Term')] as Object[],
                        "Another user has updated this Term while you were editing")
                render(view: "edit", model: [termInstance: termInstance])
                return
            }
        }

        termInstance.properties = params

        if (!termInstance.save(flush: true)) {
            render(view: "edit", model: [termInstance: termInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'term.label', default: 'Term'), termInstance.id])
        redirect(action: "list", id: termInstance.curriculum.id)
    }

    def delete(Long id) {
        def termInstance = Term.get(id)
        if (!termInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'term.label', default: 'Term'), id])
            redirect(action: "list")
            return
        }

        try {
            termInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'term.label', default: 'Term'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'term.label', default: 'Term'), id])
            redirect(action: "show", id: id)
        }
    }
}
