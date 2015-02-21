package alms

import org.springframework.dao.DataIntegrityViolationException

class BrokerBranchController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [brokerBranchInstanceList: BrokerBranch.list(params), brokerBranchInstanceTotal: BrokerBranch.count()]
    }

    def create() {
        [brokerBranchInstance: new BrokerBranch(params)]
    }

    def save() {
        def brokerBranchInstance = new BrokerBranch(params)
        if (!brokerBranchInstance.save(flush: true)) {
            render(view: "create", model: [brokerBranchInstance: brokerBranchInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'brokerBranch.label', default: 'BrokerBranch'), brokerBranchInstance.id])
        redirect(action: "show", id: brokerBranchInstance.id)
    }

    def show(Long id) {
        def brokerBranchInstance = BrokerBranch.get(id)
        if (!brokerBranchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerBranch.label', default: 'BrokerBranch'), id])
            redirect(action: "list")
            return
        }

        [brokerBranchInstance: brokerBranchInstance]
    }

    def edit(Long id) {
        def brokerBranchInstance = BrokerBranch.get(id)
        if (!brokerBranchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerBranch.label', default: 'BrokerBranch'), id])
            redirect(action: "list")
            return
        }

        [brokerBranchInstance: brokerBranchInstance]
    }

    def update(Long id, Long version) {
        def brokerBranchInstance = BrokerBranch.get(id)
        if (!brokerBranchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerBranch.label', default: 'BrokerBranch'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerBranchInstance.version > version) {
                brokerBranchInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'brokerBranch.label', default: 'BrokerBranch')] as Object[],
                        "Another user has updated this BrokerBranch while you were editing")
                render(view: "edit", model: [brokerBranchInstance: brokerBranchInstance])
                return
            }
        }

        brokerBranchInstance.properties = params

        if (!brokerBranchInstance.save(flush: true)) {
            render(view: "edit", model: [brokerBranchInstance: brokerBranchInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerBranch.label', default: 'BrokerBranch'), brokerBranchInstance.id])
        redirect(action: "show", id: brokerBranchInstance.id)
    }

    def delete(Long id) {
        def brokerBranchInstance = BrokerBranch.get(id)
        if (!brokerBranchInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerBranch.label', default: 'BrokerBranch'), id])
            redirect(action: "list")
            return
        }

        try {
            brokerBranchInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'brokerBranch.label', default: 'BrokerBranch'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brokerBranch.label', default: 'BrokerBranch'), id])
            redirect(action: "show", id: id)
        }
    }
}
