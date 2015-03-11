package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class DiscountController {

    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
    }

    def jsonList() {
        def columns = ['action', 'title', 'personType', 'discountPercentage', 'startDate', 'endDate', 'event']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = Discount.count()
        dataTableResponse.iTotalDisplayRecords = dataTableResponse.iTotalRecords
//        dataTableResponse.sEcho = Integer.valueOf(params.sEcho)

        def list

        if (params.containsKey('sSearch') && params.get('sSearch')) {
            def options = [:]
            options.max = Math.min(params.iDisplayLength ? params.int('iDisplayLength') : 10, 100)
            options.offset = params.int("iDisplayStart")
            def sortIndex = params.int("iSortCol_0")
            if (sortIndex > 0) {
                options.order = params["sSortDir_0"]
                options.sort = columns[sortIndex]
            }
            def result = Discount.search("*${params.sSearch}*", options)
            list = result.results
        } else {
            def query = queryService.listQuery(params + [columns: columns])
            list = Discount.createCriteria().list(query)
        }

        def array = list.collect { Discount it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            [action, it.title, message(code: "discount." + it.personType, default: it.personType), it.discountPercentage, it.startDate.toString(), it.endDate.toString(), it.event.toString()]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)

    }

    def create() {
        [discountInstance: new Discount(params)]
    }

    def save() {
        def discountInstance = new Discount(params)
        if (!discountInstance.save(flush: true)) {
            render(view: "create", model: [discountInstance: discountInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'discount.label', default: 'Discount'), discountInstance.id])
        redirect(action: "list")
    }

    def show(Long id) {
        def discountInstance = Discount.get(id)
        if (!discountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'discount.label', default: 'Discount'), id])
            redirect(action: "list")
            return
        }

        [discountInstance: discountInstance]
    }

    def edit(Long id) {
        def discountInstance = Discount.get(id)
        if (!discountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'discount.label', default: 'Discount'), id])
            redirect(action: "list")
            return
        }

        [discountInstance: discountInstance]
    }

    def update(Long id, Long version) {
        def discountInstance = Discount.get(id)
        if (!discountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'discount.label', default: 'Discount'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (discountInstance.version > version) {
                discountInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'discount.label', default: 'Discount')] as Object[],
                        "Another user has updated this Discount while you were editing")
                render(view: "edit", model: [discountInstance: discountInstance])
                return
            }
        }

        discountInstance.properties = params

        if (!discountInstance.save(flush: true)) {
            render(view: "edit", model: [discountInstance: discountInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'discount.label', default: 'Discount'), discountInstance.id])
        redirect(action: "show", id: discountInstance.id)
    }

    def delete(Long id) {
        def discountInstance = Discount.get(id)
        if (!discountInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'discount.label', default: 'Discount'), id])
            redirect(action: "list")
            return
        }

        try {
            discountInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'discount.label', default: 'Discount'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'discount.label', default: 'Discount'), id])
            redirect(action: "show", id: id)
        }
    }
}
