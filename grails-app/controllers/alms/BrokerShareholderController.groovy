package alms

import org.springframework.dao.DataIntegrityViolationException

class BrokerShareholderController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [brokerShareholderInstanceList: BrokerShareholder.list(params), brokerShareholderInstanceTotal: BrokerShareholder.count()]
    }

    def create() {
        [brokerShareholderInstance: new BrokerShareholder(params)]
    }

    def save() {
        def brokerShareholderInstance = new BrokerShareholder(params)
        if (!brokerShareholderInstance.save(flush: true)) {
            render(view: "create", model: [brokerShareholderInstance: brokerShareholderInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'brokerShareholder.label', default: 'BrokerShareholder'), brokerShareholderInstance.id])
        redirect(action: "show", id: brokerShareholderInstance.id)
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
}
