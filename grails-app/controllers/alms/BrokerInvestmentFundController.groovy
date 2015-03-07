package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class BrokerInvestmentFundController {

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


    def jsonList() {
        def columns = ['action','fundName','startingDate','typeAndScale','fundManager','fundCustodian','agencyFund','fundRegisterManager','liquidityGuaranteeFund','investmentManager']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = BrokerInvestmentFund.count()
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
            def result = BrokerInvestmentFund.search {
                must(term('$/BrokerInvestmentFund/broker/id', params.long("brokerId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("broker.id", params.long("brokerId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = BrokerInvestmentFund.createCriteria().list(query)
        }

        def array = list.collect { BrokerInvestmentFund it ->
            def action ="<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            println(action)
            [action, it.fundName,it.startingDate.toString(),message(code:"BrokerInvestmentFund.typeAndScale."+it.typeAndScale,it.typeAndScale),it.fundManager,it.fundCustodian,it.agencyFund,it.fundRegisterManager,it.liquidityGuaranteeFund,it.investmentManager]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }



    def create() {
        [brokerInvestmentFundInstance: new BrokerInvestmentFund(params),brokerId:params.id]
    }

    def save() {
        println(params)
        def brokerInstance=Broker.get(params.brokerId)
        //todo handle if brokerInstance is null
        if (brokerInstance) {

            def brokerInvestmentFundInstance = new BrokerInvestmentFund(params)
            brokerInstance.addToBrokerInvestmentFounds(brokerInvestmentFundInstance)
            if (!brokerInstance.save(flush: true)) {
                render(view: "create", model: [brokerInvestmentFundInstance: brokerInvestmentFundInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'brokerInvestmentFund.label', default: 'Broker Investment Found'), brokerInvestmentFundInstance.id])
            redirect(action: "list", id: brokerInstance.id)
        }

    }

    def show(Long id) {
        def brokerInvestmentFundInstance = BrokerInvestmentFund.get(id)
        if (!brokerInvestmentFundInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund'), id])
            redirect(action: "list")
            return
        }

        [brokerInvestmentFundInstance: brokerInvestmentFundInstance]
    }

    def edit(Long id) {
        def brokerInvestmentFundInstance = BrokerInvestmentFund.get(id)
        if (!brokerInvestmentFundInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund'), id])
            redirect(action: "list")
            return
        }

        [brokerInvestmentFundInstance: brokerInvestmentFundInstance]
    }

    def update(Long id, Long version) {
        def brokerInvestmentFundInstance = BrokerInvestmentFund.get(id)
        if (!brokerInvestmentFundInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerInvestmentFundInstance.version > version) {
                brokerInvestmentFundInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund')] as Object[],
                        "Another user has updated this BrokerInvestmentFund while you were editing")
                render(view: "edit", model: [brokerInvestmentFundInstance: brokerInvestmentFundInstance])
                return
            }
        }

        brokerInvestmentFundInstance.properties = params

        if (!brokerInvestmentFundInstance.save(flush: true)) {
            render(view: "edit", model: [brokerInvestmentFundInstance: brokerInvestmentFundInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund'), brokerInvestmentFundInstance.id])
        redirect(action: "list", id: brokerInvestmentFundInstance.broker.id)
    }

    def delete(Long id) {
        def brokerInvestmentFundInstance = BrokerInvestmentFund.get(id)
        if (!brokerInvestmentFundInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund'), id])
            redirect(action: "list")
            return
        }

        try {
            brokerInvestmentFundInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund'), id])
            redirect(action: "show", id: id)
        }
    }
}
