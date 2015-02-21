package alms

import org.springframework.dao.DataIntegrityViolationException

class ObtainedCertificateController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [obtainedCertificateInstanceList: ObtainedCertificate.list(params), obtainedCertificateInstanceTotal: ObtainedCertificate.count()]
    }

    def create() {
        [obtainedCertificateInstance: new ObtainedCertificate(params)]
    }

    def save() {
        def obtainedCertificateInstance = new ObtainedCertificate(params)
        if (!obtainedCertificateInstance.save(flush: true)) {
            render(view: "create", model: [obtainedCertificateInstance: obtainedCertificateInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), obtainedCertificateInstance.id])
        redirect(action: "show", id: obtainedCertificateInstance.id)
    }

    def show(Long id) {
        def obtainedCertificateInstance = ObtainedCertificate.get(id)
        if (!obtainedCertificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "list")
            return
        }

        [obtainedCertificateInstance: obtainedCertificateInstance]
    }

    def edit(Long id) {
        def obtainedCertificateInstance = ObtainedCertificate.get(id)
        if (!obtainedCertificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "list")
            return
        }

        [obtainedCertificateInstance: obtainedCertificateInstance]
    }

    def update(Long id, Long version) {
        def obtainedCertificateInstance = ObtainedCertificate.get(id)
        if (!obtainedCertificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (obtainedCertificateInstance.version > version) {
                obtainedCertificateInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate')] as Object[],
                        "Another user has updated this ObtainedCertificate while you were editing")
                render(view: "edit", model: [obtainedCertificateInstance: obtainedCertificateInstance])
                return
            }
        }

        obtainedCertificateInstance.properties = params

        if (!obtainedCertificateInstance.save(flush: true)) {
            render(view: "edit", model: [obtainedCertificateInstance: obtainedCertificateInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), obtainedCertificateInstance.id])
        redirect(action: "show", id: obtainedCertificateInstance.id)
    }

    def delete(Long id) {
        def obtainedCertificateInstance = ObtainedCertificate.get(id)
        if (!obtainedCertificateInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "list")
            return
        }

        try {
            obtainedCertificateInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'obtainedCertificate.label', default: 'ObtainedCertificate'), id])
            redirect(action: "show", id: id)
        }
    }

    def form() {
        def obtainedCer = new ObtainedCertificate()
        render(template: 'form', model: [obtainedCerInstance: obtainedCer])
    }

    def saveObtCer() {
        def person = Person.get(params.personId)
        ObtainedCertificate obtcer =new ObtainedCertificate(params)
        obtcer.save()
        person.addToCertificates(obtcer)
        person.save()

        render 0
        redirect(controller: "amendment", action: "list", params: [id: contract.id])
    }

}
