package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class OpenExamPolicyController {

    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        def openExam = OpenExam.get(params.id)
        [openExamId: openExam.id]
    }

    def jsonList() {
        def columns = ['action','title','personGroup','price','discountPercentage']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = OpenExamPolicy.count()
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
            def result = OpenExamPolicy.search {
                must(term('$/OpenExamPolicy/openExam/id', params.long("openExamId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("openExam.id", params.long("openExamId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = OpenExamPolicy.createCriteria().list(query)
        }

        def array = list.collect { OpenExamPolicy it ->
            def action ="<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            println(action)
            [action,it.title,it.personGroup.groupTitle,it.price,it.discountPercentage]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [openExamPolicyInstance: new OpenExamPolicy(params),openExamId:params.id]
    }

    def save() {
        def openExamInstance=OpenExam.get(params.openExamId)
        if(openExamInstance) {
            def openExamPolicyInstance = new OpenExamPolicy(params)
            openExamInstance.addToOpenExamPolicies(openExamPolicyInstance)
            if (!openExamPolicyInstance.save(flush: true)) {
                render(view: "create", model: [openExamPolicyInstance: openExamPolicyInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'openExamPolicy.label', default: 'OpenExamPolicy'), openExamPolicyInstance.id])
            redirect(action: "list", id: openExamPolicyInstance.openExam.id)
        }
    }

    def show(Long id) {
        def openExamPolicyInstance = OpenExamPolicy.get(id)
        if (!openExamPolicyInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExamPolicy.label', default: 'OpenExamPolicy'), id])
//            redirect(action: "list")
            return
        }

        [openExamPolicyInstance: openExamPolicyInstance]
    }

    def edit(Long id) {
        def openExamPolicyInstance = OpenExamPolicy.get(id)
        if (!openExamPolicyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExamPolicy.label', default: 'OpenExamPolicy'), id])
            redirect(action: "list")
            return
        }

        [openExamPolicyInstance: openExamPolicyInstance]
    }

    def update(Long id, Long version) {
        def openExamPolicyInstance = OpenExamPolicy.get(id)
        if (!openExamPolicyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExamPolicy.label', default: 'OpenExamPolicy'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (openExamPolicyInstance.version > version) {
                openExamPolicyInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'openExamPolicy.label', default: 'OpenExamPolicy')] as Object[],
                        "Another user has updated this OpenExamPolicy while you were editing")
                render(view: "edit", model: [openExamPolicyInstance: openExamPolicyInstance])
                return
            }
        }

        openExamPolicyInstance.properties = params

        if (!openExamPolicyInstance.save(flush: true)) {
            render(view: "edit", model: [openExamPolicyInstance: openExamPolicyInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'openExamPolicy.label', default: 'OpenExamPolicy'), openExamPolicyInstance.id])
        redirect(action: "list", id: openExamPolicyInstance.openExam.id)
    }

    def delete(Long id) {
        def openExamPolicyInstance = OpenExamPolicy.get(id)
        if (!openExamPolicyInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExamPolicy.label', default: 'OpenExamPolicy'), id])
            redirect(action: "list")
            return
        }

        try {
            openExamPolicyInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'openExamPolicy.label', default: 'OpenExamPolicy'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'openExamPolicy.label', default: 'OpenExamPolicy'), id])
            redirect(action: "show", id: id)
        }
    }
}
