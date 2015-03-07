package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class PersonController {

    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        println(params)
        def institution = Institution.get(params.id)
        if (institution) {
            [institutionId: institution.id]
        }
    }

    def jsonList() {
        println(params.toString())
        def columns = ['action', 'name', 'lastName', 'sex', 'degree', 'field', 'dateOfBirth', 'nationalCode', 'mobile', 'email']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = Person.count()
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
            def result = Person.search {
                must(term('$/Person/broker/id', params.long("institutionId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("institution.id", params.long("institutionId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = Person.createCriteria().list(query)
        }

        def array = list.collect { Person it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"+
                    "<a href='${g.createLink(controller: "obtainedCertificate",action: "list", params: [id: it.id])}'>${message(code: "certificate", default: "Cer")}</a>"
            println(action)
            [action, it.name, it.lastName, message(code: "person.sex." + it.sex, default: ""), message(code: "person.degree." + it.degree, default: ""),
             message(code: "person.field." + it.field, default: ""), it.dateOfBirth.toString(), it.nationalCode, it.mobile, it.email]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [personInstance: new Person(params),institutionId:params.id]
    }

    def save() {
        println(params)
        def institutionInstance = Institution.get(params.institutionId)
        //todo handle if brokerInstance is null
        if (institutionInstance) {
            def personInstance = new Person(params)
            institutionInstance.addToPerson(personInstance)

            if (!personInstance.save(flush: true)) {
                render(view: "create", model: [personInstance: personInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
            redirect(action: "list", id: institutionInstance.id)
        }
    }

    def show(Long id) {
        def personInstance = Person.get(id)
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), id])
            redirect(action: "list")
            return
        }

        [personInstance: personInstance]
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
        if (!personInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (personInstance.version > version) {
                personInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'person.label', default: 'Person')] as Object[],
                        "Another user has updated this Person while you were editing")
                render(view: "edit", model: [personInstance: personInstance])
                return
            }
        }

        personInstance.properties = params

        if (!personInstance.save(flush: true)) {
            render(view: "edit", model: [id: personInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
        redirect(action: "list", id: personInstance.institution.id)
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
