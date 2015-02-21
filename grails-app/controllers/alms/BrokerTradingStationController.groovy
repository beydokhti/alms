package alms

import org.springframework.dao.DataIntegrityViolationException

class BrokerTradingStationController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [brokerTradingStationInstanceList: BrokerTradingStation.list(params), brokerTradingStationInstanceTotal: BrokerTradingStation.count()]
    }

    def create() {
        [brokerTradingStationInstance: new BrokerTradingStation(params)]
    }

    def save() {
        def brokerTradingStationInstance = new BrokerTradingStation(params)
        if (!brokerTradingStationInstance.save(flush: true)) {
            render(view: "create", model: [brokerTradingStationInstance: brokerTradingStationInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation'), brokerTradingStationInstance.id])
        redirect(action: "show", id: brokerTradingStationInstance.id)
    }

    def show(Long id) {
        def brokerTradingStationInstance = BrokerTradingStation.get(id)
        if (!brokerTradingStationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation'), id])
            redirect(action: "list")
            return
        }

        [brokerTradingStationInstance: brokerTradingStationInstance]
    }

    def edit(Long id) {
        def brokerTradingStationInstance = BrokerTradingStation.get(id)
        if (!brokerTradingStationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation'), id])
            redirect(action: "list")
            return
        }

        [brokerTradingStationInstance: brokerTradingStationInstance]
    }

    def update(Long id, Long version) {
        def brokerTradingStationInstance = BrokerTradingStation.get(id)
        if (!brokerTradingStationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerTradingStationInstance.version > version) {
                brokerTradingStationInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation')] as Object[],
                        "Another user has updated this BrokerTradingStation while you were editing")
                render(view: "edit", model: [brokerTradingStationInstance: brokerTradingStationInstance])
                return
            }
        }

        brokerTradingStationInstance.properties = params

        if (!brokerTradingStationInstance.save(flush: true)) {
            render(view: "edit", model: [brokerTradingStationInstance: brokerTradingStationInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation'), brokerTradingStationInstance.id])
        redirect(action: "show", id: brokerTradingStationInstance.id)
    }

    def delete(Long id) {
        def brokerTradingStationInstance = BrokerTradingStation.get(id)
        if (!brokerTradingStationInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation'), id])
            redirect(action: "list")
            return
        }

        try {
            brokerTradingStationInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brokerTradingStation.label', default: 'BrokerTradingStation'), id])
            redirect(action: "show", id: id)
        }
    }
}
