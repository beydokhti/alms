package alms

import org.springframework.dao.DataIntegrityViolationException

class BrokerLicenseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [brokerLicenseInstanceList: BrokerLicense.list(params), brokerLicenseInstanceTotal: BrokerLicense.count()]
    }

    def create() {
        [brokerLicenseInstance: new BrokerLicense(params)]
    }

    def save() {
        def brokerLicenseInstance = new BrokerLicense(params)
        if (!brokerLicenseInstance.save(flush: true)) {
            render(view: "create", model: [brokerLicenseInstance: brokerLicenseInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'brokerLicense.label', default: 'BrokerLicense'), brokerLicenseInstance.id])
        redirect(action: "show", id: brokerLicenseInstance.id)
    }

    def show(Long id) {
        def brokerLicenseInstance = BrokerLicense.get(id)
        if (!brokerLicenseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerLicense.label', default: 'BrokerLicense'), id])
            redirect(action: "list")
            return
        }

        [brokerLicenseInstance: brokerLicenseInstance]
    }

    def edit(Long id) {
        def brokerLicenseInstance = BrokerLicense.get(id)
        if (!brokerLicenseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerLicense.label', default: 'BrokerLicense'), id])
            redirect(action: "list")
            return
        }

        [brokerLicenseInstance: brokerLicenseInstance]
    }

    def update(Long id, Long version) {
        def brokerLicenseInstance = BrokerLicense.get(id)
        if (!brokerLicenseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerLicense.label', default: 'BrokerLicense'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerLicenseInstance.version > version) {
                brokerLicenseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'brokerLicense.label', default: 'BrokerLicense')] as Object[],
                        "Another user has updated this BrokerLicense while you were editing")
                render(view: "edit", model: [brokerLicenseInstance: brokerLicenseInstance])
                return
            }
        }

        brokerLicenseInstance.properties = params

        if (!brokerLicenseInstance.save(flush: true)) {
            render(view: "edit", model: [brokerLicenseInstance: brokerLicenseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerLicense.label', default: 'BrokerLicense'), brokerLicenseInstance.id])
        redirect(action: "show", id: brokerLicenseInstance.id)
    }

    def delete(Long id) {
        def brokerLicenseInstance = BrokerLicense.get(id)
        if (!brokerLicenseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerLicense.label', default: 'BrokerLicense'), id])
            redirect(action: "list")
            return
        }

        try {
            brokerLicenseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'brokerLicense.label', default: 'BrokerLicense'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brokerLicense.label', default: 'BrokerLicense'), id])
            redirect(action: "show", id: id)
        }
    }
}
