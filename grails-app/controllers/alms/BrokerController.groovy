package alms

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class BrokerController {

    def springSecurityService
    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
    }

    def jsonList() {
        def columns = ['action', 'brokerPersianName', 'brokerLatinName', 'registerNo', 'registerLocation', 'seoRegisterNo', 'clubMembershipNo']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = Broker.count()
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
            def result = Broker.search("*${params.sSearch}*", options)
            list = result.results
        } else {
            def query = queryService.listQuery(params + [columns: columns])
            list = Broker.createCriteria().list(query)
        }

        def array = list.collect { Broker it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a><a href='${g.createLink(controller: "brokerShareholder", action: "list", params: [id: it.id])}'>${message(code: "shar", default: "Share")}</a>" +
                    "<a href='${g.createLink(controller: "brokerBranch", action: "list", params: [id: it.id])}'>${message(code: "brokerBranch", default: "Brn")}</a>" +
                    "<a href='${g.createLink(controller: "brokerInvestmentFund", action: "list", params: [id: it.id])}'>${message(code: "brokerInvestmentFund", default: "Inv")}</a>" +
                    "<a href='${g.createLink(controller: "brokerLicense", action: "list", params: [id: it.id])}'>${message(code: "brokerLicense", default: "lic")}</a>" +
                    "<a href='${g.createLink(controller: "brokerMember", action: "list", params: [id: it.id])}'>${message(code: "brokerMember", default: "mem")}</a>" +
                    "<a href='${g.createLink(controller: "brokerPortfolio", action: "list", params: [id: it.id])}'>${message(code: "brokerPortfolio", default: "Por")}</a>" +
                    "<a href='${g.createLink(controller: "brokerSoftware", action: "list", params: [id: it.id])}'>${message(code: "brokerSoftware", default: "Soft")}</a>" +
                    "<a href='${g.createLink(controller: "brokerTradingStation", action: "list", params: [id: it.id])}'>${message(code: "brokerTradingStation", default: "Trd")}</a>"
            println(action)
            [action, it.brokerPersianName, it.brokerLatinName, it.registerNo, it.registerLocation, it.seoRegisterNo.toString(), it.clubMembershipNo.toString()]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }

    def create() {
        [brokerInstance: new Broker(params)]
    }

    def save() {
        def brokerInstance = new Broker(params)

        brokerInstance.username = brokerInstance.nationalCode
        //todo mtb change password
        brokerInstance.password = "password123"
        brokerInstance.enabled = true

        if (!brokerInstance.save(flush: true)) {
            render(view: "create", model: [brokerInstance: brokerInstance])
            return
        }

        def brokerRole = Role.findByAuthority("BrokerRole")
        UserRole.findByUser(brokerInstance) ?: UserRole.create(brokerInstance, brokerRole)

        flash.message = message(code: 'default.created.message', args: [message(code: 'broker.label', default: 'Broker'), brokerInstance.id])
        redirect(action: "show", id: brokerInstance.id)
    }

    def show(Long id) {
        def brokerInstance = Broker.get(id)
        Boolean readOnly = false
        if (!brokerInstance) {
            readOnly = true
            def loginUser = springSecurityService.getPrincipal()
            if (loginUser instanceof GrailsUser) {
                def user = User.findByUsername(loginUser.username)

                brokerInstance = Broker.get(user.id)


                if (!brokerInstance) {
                    flash.message = message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), id])
                    //todo mtb why go to list?
                    redirect(action: "list")
                    return
                }
            }
        }
        [brokerInstance: brokerInstance,readOnly:readOnly]
    }

    def edit(Long id) {
        def brokerInstance = Broker.get(id)
        if (!brokerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), id])
            redirect(action: "list")
            return
        }

        [brokerInstance: brokerInstance]
    }

    def update(Long id, Long version) {
        def brokerInstance = Broker.get(id)
        if (!brokerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (brokerInstance.version > version) {
                brokerInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'broker.label', default: 'Broker')] as Object[],
                        "Another user has updated this Broker while you were editing")
                render(view: "edit", model: [brokerInstance: brokerInstance])
                return
            }
        }

        brokerInstance.properties = params

        if (!brokerInstance.save(flush: true)) {
            render(view: "edit", model: [brokerInstance: brokerInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'broker.label', default: 'Broker'), brokerInstance.id])
        redirect(action: "show", id: brokerInstance.id)
    }

    def delete(Long id) {
        def brokerInstance = Broker.get(id)
        if (!brokerInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'broker.label', default: 'Broker'), id])
            redirect(action: "list")
            return
        }

        try {
            brokerInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'broker.label', default: 'Broker'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'broker.label', default: 'Broker'), id])
            redirect(action: "show", id: id)
        }
    }
}
