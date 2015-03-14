package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class RegisteredEventController {

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
        def columns = ['action', 'person', 'event', 'mark', 'examStartDate', 'examEndDate', 'examVenue']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = RegisteredEvent.count()
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
            def result = RegisteredEvente.search {
                must(term('$/RegisteredEvent/person/id', params.long("personId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("person.id", params.long("personId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = RegisteredEvent.createCriteria().list(query)
        }
        //todo date preview is not ok!
        def array = list.collect { RegisteredEvent it ->
            def action = "<a href='${g.createLink(action: "print", params: [id: it.id])}'>${message(code: "print", default: "Print")}</a>"
            [action, it.person.toString(), it.event.toString(), it.mark, it.event.exam.examStartTime.toString(), it.event.exam.examEndTime.toString(), it.event.exam.venue]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {

        [registeredEventInstance: new RegisteredEvent(params), personId: params.id]
    }

    def save() {
        println("reffiteredEvent prams:$params")
        def personInsatnce = Person.get(params.personId)
        if (personInsatnce) {
            def registeredEventInstance = new RegisteredEvent(params)
            personInsatnce.addToRegisteredEvents(registeredEventInstance)
            if (!personInsatnce.save(flush: true)) {
                render(view: "create", model: [registeredEventInstance: registeredEventInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'registeredEvent.label', default: 'RegisteredEvent'), registeredEventInstance.id])
            redirect(action: "list", id: personInsatnce.id)
        }
    }

    def show(Long id) {
        def registeredEventInstance = RegisteredEvent.get(id)
        if (!registeredEventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredEvent.label', default: 'RegisteredEvent'), id])
            redirect(action: "list")
            return
        }

        [registeredEventInstance: registeredEventInstance]
    }

    def edit(Long id) {
        def registeredEventInstance = RegisteredEvent.get(id)
        if (!registeredEventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredEvent.label', default: 'RegisteredEvent'), id])
            redirect(action: "list")
            return
        }

        [registeredEventInstance: registeredEventInstance]
    }

    def update(Long id, Long version) {
        def registeredEventInstance = RegisteredEvent.get(id)
        if (!registeredEventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredEvent.label', default: 'RegisteredEvent'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (registeredEventInstance.version > version) {
                registeredEventInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'registeredEvent.label', default: 'RegisteredEvent')] as Object[],
                        "Another user has updated this RegisteredEvent while you were editing")
                render(view: "edit", model: [id: registeredEventInstance.id])
                return
            }
        }

        registeredEventInstance.properties = params

        if (!registeredEventInstance.save(flush: true)) {
            render(view: "edit", model: [id: registeredEventInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'registeredEvent.label', default: 'RegisteredEvent'), registeredEventInstance.id])
        redirect(action: "list", id: registeredEventInstance.person.id)
    }

    def delete(Long id) {
        def registeredEventInstance = RegisteredEvent.get(id)
        if (!registeredEventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredEvent.label', default: 'RegisteredEvent'), id])
            redirect(action: "list")
            return
        }

        try {
            registeredEventInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'registeredEvent.label', default: 'RegisteredEvent'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'registeredEvent.label', default: 'RegisteredEvent'), id])
            redirect(action: "show", id: id)
        }
    }
}
