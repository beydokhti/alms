package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class BrokerPortfolioController {

    def springSecurityService
    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {

        def brokerIns
        if (params.id) {
            brokerIns = Broker.get(params.id)
        } else {
            def loginUser = springSecurityService.getPrincipal()
            if (loginUser instanceof GrailsUser) {
                def user = User.findByUsername(loginUser.username)

                brokerIns = Broker.get(user.id)
                if (!brokerIns) {
                    return
                }
            }
        }
        if (brokerIns) {
            [brokerId: brokerIns.id]
        }
    }

    def jsonList() {
        def columns = ['action', 'countOfContract', 'sumOfContract', 'countOfConsultantContract']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = BrokerPortfolio.count()
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
            def result = BrokerPortfolio.search {
                must(term('$/BrokerPortfolio/broker/id', params.long("brokerId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("broker.id", params.long("brokerId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = BrokerPortfolio.createCriteria().list(query)
        }

        def array = list.collect { BrokerPortfolio it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            println(action)
            [action, it.countOfContract, it.sumOfContract, it.countOfConsultantContract]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [brokerPortfolioInstance: new BrokerPortfolio(params), brokerId: params.id]
    }

    def save() {
        println(params)
        def brokerInstance = Broker.get(params.brokerId)
        //todo handle if brokerInstance is null
        if (brokerInstance) {

            def brokerPortfolioInstance = new BrokerPortfolio(params)
            brokerInstance.addToBrokerPortfolios(brokerPortfolioInstance)
            if (!brokerInstance.save(flush: true)) {
                render(view: "create", model: [brokerPortfolioInstance: brokerPortfolioInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'brokerPortfolio.label', default: 'brokerPortfolio'), brokerPortfolioInstance.id])
            redirect(action: "list", id: brokerInstance.id)
        }
    }

    def show(Long id) {
        def brokerPortfolioInstance = BrokerPortfolio.get(id)
        if (!brokerPortfolioInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
//            redirect(action: "list")
            return
        }

        [brokerPortfolioInstance: brokerPortfolioInstance]
    }

    def edit(Long id) {
        def brokerPortfolioInstance = BrokerPortfolio.get(id)
        if (!brokerPortfolioInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
//            redirect(action: "list" )
            return
        }

        [brokerPortfolioInstance: brokerPortfolioInstance]
    }

    def update(Long id, Long version) {
        def brokerPortfolioInstance = BrokerPortfolio.get(id)
        if (!brokerPortfolioInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
//            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerPortfolioInstance.version > version) {
                brokerPortfolioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio')] as Object[],
                        "Another user has updated this BrokerPortfolio while you were editing")
                render(view: "edit", model: [id: brokerPortfolioInstance.id])
                return
            }
        }

        brokerPortfolioInstance.properties = params

        if (!brokerPortfolioInstance.save(flush: true)) {
            render(view: "edit", model: [id: brokerPortfolioInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), brokerPortfolioInstance.id])
        redirect(action: "list", id: brokerPortfolioInstance.broker.id)
    }

    def delete(Long id) {
        def brokerPortfolioInstance = BrokerPortfolio.get(id)
        if (!brokerPortfolioInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
//            redirect(action: "list")
            return
        }

        try {
            brokerPortfolioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
            redirect(action: "list", id: brokerPortfolioInstance.broker.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
            redirect(action: "list", id: brokerPortfolioInstance.broker.id)
        }
    }
}
