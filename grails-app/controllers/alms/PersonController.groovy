package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class PersonController {

    def springSecurityService
    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
    }

    def jsonList() {
        def columns = ['action', 'name', 'lastName', 'sex', 'degree', 'field', 'dateOfBirth', 'nationalCode', 'mobile', 'email']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = Person.count()
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
            def result = Person.search("*${params.sSearch}*", options)
            list = result.results
        } else {
            def query = queryService.listQuery(params + [columns: columns])
            list = Person.createCriteria().list(query)
        }
        def array = list.collect { Person it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>" +
                    "<a href='${g.createLink(controller: "registeredEvent", action: "list", params: [id: it.id])}'>${message(code: "registeredEvent", default: "Reg")}</a>" +
                    "<a href='${g.createLink(controller: "person", action: "resume", params: [id: it.id])}'>${message(code: "resume", default: "Res")}</a>" +
                    "<a href='${g.createLink(controller: "obtainedCertificate", action: "list", params: [id: it.id])}'>${message(code: "obtainedCertificate", default: "Cer")}</a>"
            [action, it.name, it.lastName, it.sex, it.degree, it.field, it.dateOfBirth, it.nationalCode, it.mobile, it.email]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }

    def resume(Integer max) {
        [personId: params.id]
    }

    def jsonResumeList() {
        def brokColumns = ['broker', 'startDate', 'endDate', 'isActive', 'position']
        def insColumns = ['institution', 'startDate', 'endDate', 'isActive', 'position']
        def array

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = BrokerMember.count() + InstitutionMember.count()
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
                options.sort = brokColumns[sortIndex]
            }
            def result = BrokerMember.search {
                must(term('$/BrokerMember/person/id', params.long("personId")))
//                must(term('$/BrokerMember/isActive', true))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("person.id", params.long("personId"))
//                eq("isActive", true)
            }
            def query = queryService.decorate(params + [columns: brokColumns], query_criteria)
            list = BrokerMember.createCriteria().list(query)
        }
        def arrayBrok = list.collect { BrokerMember it ->
            [it.broker.toString(), it.startDate, it.endDate, it.isActive, it.position]
        }

        if (params.containsKey('sSearch') && params.get('sSearch')) {
            def options = [:]
            options.max = Math.min(params.iDisplayLength ? params.int('iDisplayLength') : 10, 100)
            options.offset = params.int("iDisplayStart")
            def sortIndex = params.int("iSortCol_0")
            if (sortIndex > 0) {
                options.order = params["sSortDir_0"]
                options.sort = insColumns[sortIndex]
            }
            def result = InstitutionMember.search {
                must(term('$/InstitutionMember/person/id', params.long("personId")))
//                must(term('$/InstitutionMember/isActive', true))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("person.id", params.long("personId"))
//                eq("isActive", true)
            }
            def query = queryService.decorate(params + [columns: insColumns], query_criteria)
            list = InstitutionMember.createCriteria().list(query)
        }
        def arrayIns = list.collect { InstitutionMember it ->
            [it.institution.toString(), it.startDate, it.endDate, it.isActive, ""]
        }

        dataTableResponse.aaData = arrayBrok + arrayIns
        render(dataTableResponse as JSON)
    }

    def create() {
        [personInstance: new Person(params), institutionId: params.id]
    }

    def save() {
        def personInstance = new Person(params)
        //todo handle if personInstance is null
        if (!Person.findAllByNationalCode(params.nationalCode)&&!User.findByUsername(params.nationalCode)) {
            personInstance.username = personInstance.nationalCode
            personInstance.password = "password123"
            personInstance.enabled = true
            if (!personInstance.save(flush: true)) {
                render(view: "create", model: [personInstance: personInstance])
                return
            }

            def personRole = Role.findByAuthority("PersonRole")
            UserRole.findByUser(personInstance) ?: UserRole.create(personInstance, personRole)

            flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
            redirect(action: "list")
        } else {
            flash.message = message(code: 'person.unique.nationalId.message', default: 'National ID is Unique')
            render(view: "create", model: [personInstance: personInstance])
            return

        }
    }

    def signUp() {
        [personInstance: new Person(params), institutionId: params.id]
    }

    def saveSignUp() {
        def personInstance = new Person(params)
        //todo handle if personInstance is null
        if (!Person.findAllByNationalCode(params.nationalCode)) {
            personInstance.enabled = true
            if (!personInstance.save(flush: true)) {
                render(view: "signUp", model: [personInstance: personInstance])
                return
            }

            def personRole = Role.findByAuthority("PersonRole")
            UserRole.findByUser(personInstance) ?: UserRole.create(personInstance, personRole)

            flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
            redirect(action: "showSignUp", id: personInstance.id)
        } else {
            flash.message = message(code: 'person.unique.nationalId.message', default: 'National ID is Unique')
            render(view: "signUp", model: [personInstance: personInstance])
            return

        }
    }

    def showSignUp(Long id) {
//        def personInstance = Person.get(id)
//        [personInstance: personInstance]
    }


    def show(Long id) {
        def personInstance = Person.get(id)
        Boolean readOnly = false
        if (!personInstance) {
            readOnly = true
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

        [personInstance: personInstance, readOnly: readOnly]
    }

    def edit(Long id) {
        def personInstance = Person.get(id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), id])
            redirect(action: "list")
            return
        }

        [personInstance: personInstance]
    }

    def update(Long id, Long version) {
        def personInstance = Person.get(id)
        def loginUser = springSecurityService.getPrincipal()
        if (loginUser instanceof GrailsUser) {
            def user = User.findByUsername(loginUser.username)
            def ur = UserRole.findByUser(user)

            if (!personInstance) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), id])
                if (ur.role == "AdminRole") {
                    redirect(action: "list")
                } else {
                    redirect(action: "show", id: personInstance.id)
                }
                return
            }

            if (version != null) {
                if (personInstance.version > version) {
                    personInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                            [message(code: 'person.label', default: 'Person')] as Object[],
                            "Another user has updated this Person while you were editing")
                    render(view: "edit", model: [id: personInstance.id])
                    return
                }
            }

            personInstance.properties = params
            if (!Person.findAllByNationalCode(params.nationalCode)) {

                if (!personInstance.save(flush: true)) {
                    render(view: "edit", model: [id: personInstance])
                    return
                }

                flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
                if (ur.role == "AdminRole") {
                    redirect(action: "list")
                } else {
                    redirect(action: "show", id: personInstance.id)
                }
            } else {
//            flash.message = message(code: 'person.unique.nationalId.message', default: 'National ID is Unique')
                render(view: "edit", model: [personInstance: personInstance])
                return

            }
        }
    }

    def delete(Long id) {
        def personInstance = Person.get(id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), id])
            redirect(action: "list")
            return
        }

        try {
            personInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'person.label', default: 'Person'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'person.label', default: 'Person'), id])
            redirect(action: "show", id: id)
        }
    }
}
