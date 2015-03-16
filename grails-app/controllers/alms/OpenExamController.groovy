package alms

import org.springframework.dao.DataIntegrityViolationException

class OpenExamController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [openExamInstanceList: OpenExam.list(params), openExamInstanceTotal: OpenExam.count()]
    }

    def create() {
        [openExamInstance: new OpenExam(params)]
    }

    def save() {
        def openExamInstance = new OpenExam(params)
        if (!openExamInstance.save(flush: true)) {
            render(view: "create", model: [openExamInstance: openExamInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'openExam.label', default: 'OpenExam'), openExamInstance.id])
        redirect(action: "show", id: openExamInstance.id)
    }

    def show(Long id) {
        def openExamInstance = OpenExam.get(id)
        if (!openExamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "list")
            return
        }

        [openExamInstance: openExamInstance]
    }

    def edit(Long id) {
        def openExamInstance = OpenExam.get(id)
        if (!openExamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "list")
            return
        }

        [openExamInstance: openExamInstance]
    }

    def update(Long id, Long version) {
        def openExamInstance = OpenExam.get(id)
        if (!openExamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (openExamInstance.version > version) {
                openExamInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'openExam.label', default: 'OpenExam')] as Object[],
                        "Another user has updated this OpenExam while you were editing")
                render(view: "edit", model: [openExamInstance: openExamInstance])
                return
            }
        }

        openExamInstance.properties = params

        if (!openExamInstance.save(flush: true)) {
            render(view: "edit", model: [openExamInstance: openExamInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'openExam.label', default: 'OpenExam'), openExamInstance.id])
        redirect(action: "show", id: openExamInstance.id)
    }

    def delete(Long id) {
        def openExamInstance = OpenExam.get(id)
        if (!openExamInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "list")
            return
        }

        try {
            openExamInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'openExam.label', default: 'OpenExam'), id])
            redirect(action: "show", id: id)
        }
    }
}
