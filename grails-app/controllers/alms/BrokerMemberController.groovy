package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class BrokerMemberController {

    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        println(params)
        def brokerIns = Broker.get(params.id)
        if (brokerIns) {
            [brokerId: brokerIns.id]
        }
    }

    def jsonList() {
        def columns = ['action', 'name', 'lastName', 'sex', 'position', 'startDate', 'degree', 'field', 'dateOfBirth', 'nationalCode', 'mobile', 'email']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = BrokerMember.count()
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
            def result = BrokerMember.search {
                must(term('$/BrokerMember/broker/id', params.long("brokerId")))
                must(term('$/BrokerMember/isActive', true))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("broker.id", params.long("brokerId"))
                eq("isActive",true)
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = BrokerMember.createCriteria().list(query)
        }

        def array = list.collect { BrokerMember it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"+
                    "<a href='${g.createLink(controller: "obtainedCertificate",action: "list", params: [id: it.id])}'>${message(code: "certificate", default: "Cer")}</a>"
            println(action)
            [action, it.person.name, it.person.lastName, message(code: "person.sex." + it.person.sex, default: it.person.sex), message(code: "brokerMember.position." + it.position, default: it.position),
             it.startDate, message(code: "person.degree." + it.person.degree, default: it.person.degree),
             message(code: "person.field." + it.person.field, it.person.field), it.person.dateOfBirth, it.person.nationalCode,
             it.person.mobile, it.person.email]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [brokerMemberInstance: new BrokerMember(params), brokerId: params.id]
    }

    def save() {
        println(params)
        def brokerInstance = Broker.get(params.brokerId)
        //todo handle if brokerInstance is null
        if (brokerInstance) {

            def brokerMemberInstance = new BrokerMember(params)
            brokerMemberInstance.isActive = true

            def brokerMemberList = BrokerMember.findAllByPerson(brokerMemberInstance.person)
            brokerMemberList.each { member ->
                if (!member.endDate) {
                    member.endDate = brokerMemberInstance.startDate
                }
                member.isActive = false
                member.save()
            }

            def institutionMemberList=InstitutionMember.findAllByPerson(brokerMemberInstance.person)
            institutionMemberList.each { member ->
                if (!member.endDate) {
                    member.endDate = brokerMemberInstance.startDate
                }
                member.isActive = false
                member.save()
            }


            brokerInstance.addToBrokerMembers(brokerMemberInstance)
//            if (!brokerInstance.save(flush: true)) {
//                render(view: "create", model: [brokerMemberInstance: brokerMemberInstance])
//                return
//            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'brokerMember.label', default: 'brokerMember'), brokerMemberInstance.id])
            redirect(action: "list", id: brokerInstance.id)
        }

    }

    def saveAll() {
        println(params)
        def brokerInstance = Broker.get(params.brokerId)
        //todo handle if brokerInstance is null
        if (brokerInstance) {

            def brokerMemberInstance = new BrokerMember(params)
            def person = new Person(params)
            person.save()
            brokerMemberInstance.person = person
            brokerMemberInstance.isActive = true
            brokerInstance.addToBrokerMembers(brokerMemberInstance)
            if (!brokerInstance.save(flush: true)) {
                render(view: "create", model: [brokerMemberInstance: brokerMemberInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'brokerMember.label', default: 'brokerMember'), brokerMemberInstance.id])
            redirect(action: "list", id: brokerInstance.id)
        }

    }

    def show(Long id) {
        def brokerMemberInstance = BrokerMember.get(id)
        if (!brokerMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "list")
            return
        }

        [brokerMemberInstance: brokerMemberInstance]
    }

    def edit(Long id) {
        def brokerMemberInstance = BrokerMember.get(id)
        if (!brokerMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "list")
            return
        }

        [brokerMemberInstance: brokerMemberInstance]
    }

    def update(Long id, Long version) {
        def brokerMemberInstance = BrokerMember.get(id)
        if (!brokerMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerMemberInstance.version > version) {
                brokerMemberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'brokerMember.label', default: 'BrokerMember')] as Object[],
                        "Another user has updated this BrokerMember while you were editing")
                render(view: "edit", model: [brokerMemberInstance: brokerMemberInstance])
                return
            }
        }

        brokerMemberInstance.properties = params

        if (!brokerMemberInstance.save(flush: true)) {
            render(view: "edit", model: [brokerMemberInstance: brokerMemberInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), brokerMemberInstance.id])
        redirect(action: "list", id: brokerMemberInstance.broker.id)
    }

    def updateAll(Long id, Long version) {
        println(params)
        def brokerMemberInstance = BrokerMember.get(id)
        if (!brokerMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerMemberInstance.version > version) {
                brokerMemberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'brokerMember.label', default: 'BrokerMember')] as Object[],
                        "Another user has updated this BrokerMember while you were editing")
                render(view: "edit", model: [brokerMemberInstance: brokerMemberInstance])
                return
            }
        }

        brokerMemberInstance.properties = params
        brokerMemberInstance.person.properties = params

        if (!brokerMemberInstance.save(flush: true)) {
            render(view: "edit", model: [brokerMemberInstance: brokerMemberInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), brokerMemberInstance.id])
        redirect(action: "list", id: brokerMemberInstance.broker.id)
    }


    def delete(Long id) {
        def brokerMemberInstance = BrokerMember.get(id)
        if (!brokerMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "list")
            return
        }

        try {
            brokerMemberInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "show", id: id)
        }
    }

    def Assign() {
        [brokerMemberInstance: new BrokerMember(params), brokerId: params.id]
    }
}
