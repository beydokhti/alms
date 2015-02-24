package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class BrokerShareholderController {
    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        println(params)
        def brokerIns=Broker.get(params.id)
        if (brokerIns) {
            [brokerId: brokerIns.id]
        }
    }

    def create() {
        println(params)
        [brokerShareholderInstance: new BrokerShareholder(params),brokerId:params.id]
    }

    def save() {
        println(params)
        def brokerInstance=Broker.get(params.brokerId)
        //todo handle if brokerInstance is null
        if (brokerInstance) {
            def brokerShareholderInstance = new BrokerShareholder(params)
            brokerInstance.addToBrokerShareholders(brokerShareholderInstance)
            if (!brokerInstance.save(flush: true)) {
                render(view: "create", model: [brokerShareholderInstance: brokerShareholderInstance,brokerId: brokerInstance.id])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'brokerShareholder.label', default: 'BrokerShareholder'), brokerShareholderInstance.id])
            //todo after create go to list or show?
            redirect(action: "list", id: brokerInstance.id)
        }
    }

    def show(Long id) {
        def brokerShareholderInstance = BrokerShareholder.get(id)
        if (!brokerShareholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerShareholder.label', default: 'BrokerShareholder'), id])
            redirect(action: "list")
            return
        }

        [brokerShareholderInstance: brokerShareholderInstance]
    }

    def edit(Long id) {
        def brokerShareholderInstance = BrokerShareholder.get(id)
        if (!brokerShareholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerShareholder.label', default: 'BrokerShareholder'), id])
            redirect(action: "list")
            return
        }

        [brokerShareholderInstance: brokerShareholderInstance]
    }

    def update(Long id, Long version) {
        def brokerShareholderInstance = BrokerShareholder.get(id)
        if (!brokerShareholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerShareholder.label', default: 'BrokerShareholder'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerShareholderInstance.version > version) {
                brokerShareholderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'brokerShareholder.label', default: 'BrokerShareholder')] as Object[],
                        "Another user has updated this BrokerShareholder while you were editing")
                render(view: "edit", model: [brokerShareholderInstance: brokerShareholderInstance])
                return
            }
        }

        brokerShareholderInstance.properties = params

        if (!brokerShareholderInstance.save(flush: true)) {
            render(view: "edit", model: [brokerShareholderInstance: brokerShareholderInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerShareholder.label', default: 'BrokerShareholder'), brokerShareholderInstance.id])
        redirect(action: "show", id: brokerShareholderInstance.id)
    }

    def delete(Long id) {
        def brokerShareholderInstance = BrokerShareholder.get(id)
        if (!brokerShareholderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerShareholder.label', default: 'BrokerShareholder'), id])
            redirect(action: "list")
            return
        }

        try {
            brokerShareholderInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'brokerShareholder.label', default: 'BrokerShareholder'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brokerShareholder.label', default: 'BrokerShareholder'), id])
            redirect(action: "show", id: id)
        }
    }
    def jsonList() {
        def columns = ['action', 'shareholderName', 'ownershipType', 'ownershipPercent', 'sharesCount', 'representativeOnBoard', 'description']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = BrokerShareholder.count()
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
            def result = BrokerShareholder.search {
                must(term('$/BrokerShareholder/broker/id', params.long("brokerId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("broker.id", params.long("brokerId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = BrokerShareholder.createCriteria().list(query)
        }

        def array = list.collect { BrokerShareholder it ->
            def action ="<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            println(action)
            [action, it.shareholderName, it.ownershipType, it.ownershipPercent.toString(), it.sharesCount.toString(), it.representativeOnBoard, it.description]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }

}
