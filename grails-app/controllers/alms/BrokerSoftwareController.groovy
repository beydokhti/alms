package alms

import org.springframework.dao.DataIntegrityViolationException

class BrokerSoftwareController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [brokerSoftwareInstanceList: BrokerSoftware.list(params), brokerSoftwareInstanceTotal: BrokerSoftware.count()]
    }

    def create() {
        [brokerSoftwareInstance: new BrokerSoftware(params)]
    }

    def save() {
        def brokerSoftwareInstance = new BrokerSoftware(params)
        if (!brokerSoftwareInstance.save(flush: true)) {
            render(view: "create", model: [brokerSoftwareInstance: brokerSoftwareInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'brokerSoftware.label', default: 'BrokerSoftware'), brokerSoftwareInstance.id])
        redirect(action: "show", id: brokerSoftwareInstance.id)
    }

    def show(Long id) {
        def brokerSoftwareInstance = BrokerSoftware.get(id)
        if (!brokerSoftwareInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerSoftware.label', default: 'BrokerSoftware'), id])
            redirect(action: "list")
            return
        }

        [brokerSoftwareInstance: brokerSoftwareInstance]
    }

    def edit(Long id) {
        def brokerSoftwareInstance = BrokerSoftware.get(id)
        if (!brokerSoftwareInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerSoftware.label', default: 'BrokerSoftware'), id])
            redirect(action: "list")
            return
        }

        [brokerSoftwareInstance: brokerSoftwareInstance]
    }

    def update(Long id, Long version) {
        def brokerSoftwareInstance = BrokerSoftware.get(id)
        if (!brokerSoftwareInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerSoftware.label', default: 'BrokerSoftware'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerSoftwareInstance.version > version) {
                brokerSoftwareInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'brokerSoftware.label', default: 'BrokerSoftware')] as Object[],
                        "Another user has updated this BrokerSoftware while you were editing")
                render(view: "edit", model: [brokerSoftwareInstance: brokerSoftwareInstance])
                return
            }
        }

        brokerSoftwareInstance.properties = params

        if (!brokerSoftwareInstance.save(flush: true)) {
            render(view: "edit", model: [brokerSoftwareInstance: brokerSoftwareInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerSoftware.label', default: 'BrokerSoftware'), brokerSoftwareInstance.id])
        redirect(action: "show", id: brokerSoftwareInstance.id)
    }

    def delete(Long id) {
        def brokerSoftwareInstance = BrokerSoftware.get(id)
        if (!brokerSoftwareInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerSoftware.label', default: 'BrokerSoftware'), id])
            redirect(action: "list")
            return
        }

        try {
            brokerSoftwareInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'brokerSoftware.label', default: 'BrokerSoftware'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brokerSoftware.label', default: 'BrokerSoftware'), id])
            redirect(action: "show", id: id)
        }
    }
}
