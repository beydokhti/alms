package alms

import org.springframework.dao.DataIntegrityViolationException

class BrokerMemberController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [brokerMemberInstanceList: BrokerMember.list(params), brokerMemberInstanceTotal: BrokerMember.count()]
    }

    def create() {
        [brokerMemberInstance: new BrokerMember(params)]
    }

    def save() {
        def brokerMemberInstance = new BrokerMember(params)
        if (!brokerMemberInstance.save(flush: true)) {
            render(view: "create", model: [brokerMemberInstance: brokerMemberInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), brokerMemberInstance.id])
        redirect(action: "show", id: brokerMemberInstance.id)
    }

    def show(Long id) {
        def brokerMemberInstance = BrokerMember.get(id)
        if (!brokerMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "list")
            return
        }

        [brokerMemberInstance: brokerMemberInstance]
    }

    def edit(Long id) {
        def brokerMemberInstance = BrokerMember.get(id)
        if (!brokerMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "list")
            return
        }

        [brokerMemberInstance: brokerMemberInstance]
    }

    def update(Long id, Long version) {
        def brokerMemberInstance = BrokerMember.get(id)
        if (!brokerMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerMemberInstance.version > version) {
                brokerMemberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'brokerMember.label', default: 'BrokerMember')] as Object[],
                          "Another user has updated this BrokerMember while you were editing")
                render(view: "edit", model: [brokerMemberInstance: brokerMemberInstance])
                return
            }
        }

        brokerMemberInstance.properties = params

        if (!brokerMemberInstance.save(flush: true)) {
            render(view: "edit", model: [brokerMemberInstance: brokerMemberInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), brokerMemberInstance.id])
        redirect(action: "show", id: brokerMemberInstance.id)
    }

    def delete(Long id) {
        def brokerMemberInstance = BrokerMember.get(id)
        if (!brokerMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "list")
            return
        }

        try {
            brokerMemberInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'brokerMember.label', default: 'BrokerMember'), id])
            redirect(action: "show", id: id)
        }
    }
}
