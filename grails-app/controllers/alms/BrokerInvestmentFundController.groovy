package alms

import org.springframework.dao.DataIntegrityViolationException

class BrokerInvestmentFundController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [brokerInvestmentFundInstanceList: BrokerInvestmentFund.list(params), brokerInvestmentFundInstanceTotal: BrokerInvestmentFund.count()]
    }

    def create() {
        [brokerInvestmentFundInstance: new BrokerInvestmentFund(params)]
    }

    def save() {
        def brokerInvestmentFundInstance = new BrokerInvestmentFund(params)
        if (!brokerInvestmentFundInstance.save(flush: true)) {
            render(view: "create", model: [brokerInvestmentFundInstance: brokerInvestmentFundInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'brokerInvestmentFund.label', default: 'BrokerInvestmentFund'), brokerInvestmentFundInstance.id])
        redirect(action: "show", id: brokerInvestmentFundInstance.id)
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
        redirect(action: "show", id: brokerInvestmentFundInstance.id)
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
