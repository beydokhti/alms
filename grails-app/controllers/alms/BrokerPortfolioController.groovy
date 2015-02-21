package alms

import org.springframework.dao.DataIntegrityViolationException

class BrokerPortfolioController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [brokerPortfolioInstanceList: BrokerPortfolio.list(params), brokerPortfolioInstanceTotal: BrokerPortfolio.count()]
    }

    def create() {
        [brokerPortfolioInstance: new BrokerPortfolio(params)]
    }

    def save() {
        def brokerPortfolioInstance = new BrokerPortfolio(params)
        if (!brokerPortfolioInstance.save(flush: true)) {
            render(view: "create", model: [brokerPortfolioInstance: brokerPortfolioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), brokerPortfolioInstance.id])
        redirect(action: "show", id: brokerPortfolioInstance.id)
    }

    def show(Long id) {
        def brokerPortfolioInstance = BrokerPortfolio.get(id)
        if (!brokerPortfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
            redirect(action: "list")
            return
        }

        [brokerPortfolioInstance: brokerPortfolioInstance]
    }

    def edit(Long id) {
        def brokerPortfolioInstance = BrokerPortfolio.get(id)
        if (!brokerPortfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
            redirect(action: "list")
            return
        }

        [brokerPortfolioInstance: brokerPortfolioInstance]
    }

    def update(Long id, Long version) {
        def brokerPortfolioInstance = BrokerPortfolio.get(id)
        if (!brokerPortfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerPortfolioInstance.version > version) {
                brokerPortfolioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio')] as Object[],
                        "Another user has updated this BrokerPortfolio while you were editing")
                render(view: "edit", model: [brokerPortfolioInstance: brokerPortfolioInstance])
                return
            }
        }

        brokerPortfolioInstance.properties = params

        if (!brokerPortfolioInstance.save(flush: true)) {
            render(view: "edit", model: [brokerPortfolioInstance: brokerPortfolioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), brokerPortfolioInstance.id])
        redirect(action: "show", id: brokerPortfolioInstance.id)
    }

    def delete(Long id) {
        def brokerPortfolioInstance = BrokerPortfolio.get(id)
        if (!brokerPortfolioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
            redirect(action: "list")
            return
        }

        try {
            brokerPortfolioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brokerPortfolio.label', default: 'BrokerPortfolio'), id])
            redirect(action: "show", id: id)
        }
    }
}
