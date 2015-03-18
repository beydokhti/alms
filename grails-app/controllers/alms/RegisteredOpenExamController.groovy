package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

import java.awt.List

class RegisteredOpenExamController {

    def springSecurityService
    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        def personInstance = Person.get(params.id)
        if (!personInstance) {
            def loginUser = springSecurityService.getPrincipal()
            if (loginUser instanceof GrailsUser) {
                def user = User.findByUsername(loginUser.username)

                personInstance = Person.get(user.id)

                if (!personInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'institution.label', default: 'Institution'), id])
                    //todo mtb why go to list?
                    redirect(action: "list")
                    return
                }
            }
        }

        if (personInstance) {
            [personId: personInstance.id]
        }
    }

    def jsonList() {
        def columns = ['action', 'title', 'examStartTime', 'examEndTime', 'venue', 'description']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = RegisteredOpenExam.count()
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
            def result = BrokerBranch.search {
                must(term('$/registeredOpenExam/person/id', params.long("personId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results

        } else {
            def query_criteria = {
                eq("person.id", params.long("personId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = RegisteredOpenExam.createCriteria().list(query)
        }
        def array = list.collect { RegisteredOpenExam it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            [action, it.openExam.title, it.openExam.examStartTime, it.openExam.examEndTime, it.openExam.venue, it.openExam.description]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }

    def create() {
        def personInstance = Person.get(params.id)
        def registeredOpenExamInstance = new RegisteredOpenExam(params)
        def isBrokerMember = BrokerMember.findByPersonAndIsActive(personInstance, true)
        def isInstitutionMember = InstitutionMember.findByPersonAndIsActive(personInstance, true)

        PersonGroup personGroupInstance
        if (isBrokerMember) {
            personGroupInstance = PersonGroup.findByGroupTitle("brokerMember")
        } else if (isInstitutionMember) {
            personGroupInstance = PersonGroup.findByGroupTitle("institutionMember")
        } else {
            personGroupInstance = PersonGroup.findByGroupTitle("independent")
        }

        def freeExam = OpenExam.findAll("from OpenExam o where size(o.openExamPolicies) = 0").toList()

        def limitExam = OpenExamPolicy.findAllByPersonGroup(personGroupInstance).openExam.toList()

        [registeredOpenExamInstance: registeredOpenExamInstance, personId: personInstance.id, examList: freeExam + limitExam]
    }

    def save() {
        def personInstance = Person.get(params.personId)
        if (personInstance) {

            def registeredOpenExamInstance = new RegisteredOpenExam(params)
            personInstance.addToRegisteredOpenExam(registeredOpenExamInstance)
            if (!registeredOpenExamInstance.save(flush: true)) {
                render(view: "create", model: [registeredOpenExamInstance: registeredOpenExamInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'registeredOpenExam.label', default: 'RegisteredOpenExam'), registeredOpenExamInstance.id])
            redirect(action: "list", id: registeredOpenExamInstance.person.id)
        }
    }

    def show(Long id) {
        def registeredOpenExamInstance = RegisteredOpenExam.get(id)
        if (!registeredOpenExamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredOpenExam.label', default: 'RegisteredOpenExam'), id])
            redirect(action: "list")
            return
        }

        [registeredOpenExamInstance: registeredOpenExamInstance]
    }

    def edit(Long id) {
        def registeredOpenExamInstance = RegisteredOpenExam.get(id)
        if (!registeredOpenExamInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredOpenExam.label', default: 'RegisteredOpenExam'), id])
//            redirect(action: "list")
            return
        }

        [registeredOpenExamInstance: registeredOpenExamInstance]
    }

    def update(Long id, Long version) {
        def registeredOpenExamInstance = RegisteredOpenExam.get(id)
        if (!registeredOpenExamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredOpenExam.label', default: 'RegisteredOpenExam'), id])
            redirect(action: "list", id: registeredOpenExamInstance.person.id)
            return
        }

        if (version != null) {
            if (registeredOpenExamInstance.version > version) {
                registeredOpenExamInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'registeredOpenExam.label', default: 'RegisteredOpenExam')] as Object[],
                        "Another user has updated this RegisteredOpenExam while you were editing")
                render(view: "edit", model: [registeredOpenExamInstance: registeredOpenExamInstance])
                return
            }
        }

        registeredOpenExamInstance.properties = params

        if (!registeredOpenExamInstance.save(flush: true)) {
            render(view: "edit", model: [registeredOpenExamInstance: registeredOpenExamInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'registeredOpenExam.label', default: 'RegisteredOpenExam'), registeredOpenExamInstance.id])
        redirect(action: "list", id: registeredOpenExamInstance.person.id)
    }

    def delete(Long id) {
        def registeredOpenExamInstance = RegisteredOpenExam.get(id)
        if (!registeredOpenExamInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredOpenExam.label', default: 'RegisteredOpenExam'), id])
//            redirect(action: "list")
            return
        }

        try {
            registeredOpenExamInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'registeredOpenExam.label', default: 'RegisteredOpenExam'), id])
            redirect(action: "list", id: registeredOpenExamInstance.person.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'registeredOpenExam.label', default: 'RegisteredOpenExam'), id])
            redirect(action: "list", id: registeredOpenExamInstance.person.id)
        }
    }
}
