package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class RegisteredTermController {

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
        } else {
            def loginUser = springSecurityService.getPrincipal()
            if (loginUser instanceof GrailsUser) {
                def user = User.findByUsername(loginUser.username)

                personIns = Person.get(user.id)
                if (!personIns) {
                    return
                }
            }
        }
        [personId: personIns.id]
    }

    def jsonList() {
        def columns = ['action', 'person', 'term', 'mark', 'examStartDate', 'examEndDate', 'examVenue']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = RegisteredTerm.count()
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
            def result = RegisteredTerm.search {
                must(term('$/RegisteredTerm/person/id', params.long("personId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("person.id", params.long("personId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = RegisteredTerm.createCriteria().list(query)
        }
        //todo date preview is not ok!
        def array = list.collect { RegisteredTerm it ->
            def action = "<a href='${g.createLink(action: "print", params: [id: it.id])}'>${message(code: "print", default: "Print")}</a>"
            [action, it.person.toString(), it.term.toString(), it.mark, it.term.exam.examStartTime.toString(), it.term.exam.examEndTime.toString(), it.term.exam.venue]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {

        [registeredTermInstance: new RegisteredTerm(params), personId: params.id]
    }

    def save() {
        println("registeredTerm prams:$params")
        def personInsatnce = Person.get(params.personId)
        if (personInsatnce) {
            def registeredTermInstance = new RegisteredTerm(params)
            personInsatnce.addToRegisteredTerms(registeredTermInstance)
            if (!personInsatnce.save(flush: true)) {
                render(view: "create", model: [registeredTermInstance: registeredTermInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'registeredTerm.label', default: 'RegisteredTerm'), registeredTermInstance.id])
            redirect(action: "list", id: personInsatnce.id)
        }
    }

    def show(Long id) {
        def registeredTermInstance = RegisteredTerm.get(id)
        if (!registeredTermInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredTerm.label', default: 'RegisteredTerm'), id])
            redirect(action: "list")
            return
        }

        [registeredTermInstance: registeredTermInstance]
    }

    def edit(Long id) {
        def registeredTermInstance = RegisteredTerm.get(id)
        if (!registeredTermInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredTerm.label', default: 'RegisteredTerm'), id])
            redirect(action: "list")
            return
        }

        [registeredTermInstance: registeredTermInstance]
    }

    def update(Long id, Long version) {
        def registeredTermInstance = RegisteredTerm.get(id)
        if (!registeredTermInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredTerm.label', default: 'RegisteredTerm'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (registeredTermInstance.version > version) {
                registeredTermInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'registeredTerm.label', default: 'RegisteredTerm')] as Object[],
                        "Another user has updated this RegisteredTerm while you were editing")
                render(view: "edit", model: [id: registeredTermInstance.id])
                return
            }
        }

        registeredTermInstance.properties = params

        if (!registeredTermInstance.save(flush: true)) {
            render(view: "edit", model: [id: registeredTermInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'registeredTerm.label', default: 'RegisteredTerm'), registeredTermInstance.id])
        redirect(action: "list", id: registeredTermInstance.person.id)
    }

    def delete(Long id) {
        def registeredTermInstance = RegisteredTerm.get(id)
        if (!registeredTermInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredTerm.label', default: 'RegisteredTerm'), id])
            redirect(action: "list")
            return
        }

        try {
            registeredTermInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'registeredTerm.label', default: 'RegisteredTerm'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'registeredTerm.label', default: 'RegisteredTerm'), id])
            redirect(action: "show", id: id)
        }
    }
}
