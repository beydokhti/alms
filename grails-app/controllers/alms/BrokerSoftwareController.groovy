package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class BrokerSoftwareController {

    def springSecurityService
    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        def brokerIns
        if (params.id) {
            brokerIns = Broker.get(params.id)
        } else {
            def loginUser = springSecurityService.getPrincipal()
            if (loginUser instanceof GrailsUser) {
                def user = User.findByUsername(loginUser.username)

                brokerIns = Broker.get(user.id)
                if (!brokerIns) {
                    return
                }
            }
        }

        if (brokerIns) {
            [brokerId: brokerIns.id]
        }
    }

    def jsonList() {
        def columns = ['action','title1','title2','companyName','contractType']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = BrokerSoftware.count()
        dataTableResponse.iTotalDisplayRecords = dataTableResponse.iTotalRecords

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
            def result = BrokerSoftware.search {
                must(term('$/BrokerSoftware/broker/id', params.long("brokerId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("broker.id", params.long("brokerId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = BrokerSoftware.createCriteria().list(query)
        }

        def array = list.collect { BrokerSoftware it ->
            def action ="<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            println(action)
            [action,it.title1,it.title2,it.companyName,message(code:"brokerSoftwareController.contractType."+it.contractType,default: it.contractType)]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }



    def create() {
        [brokerSoftwareInstance: new BrokerSoftware(params),brokerId:params.id]
    }

    def save() {
        println(params)
        def brokerInstance=Broker.get(params.brokerId)
        //todo handle if brokerInstance is null
        if (brokerInstance) {

            def brokerSoftwareInstance = new BrokerSoftware(params)
            brokerInstance.addToBrokerSoftware(brokerSoftwareInstance)
            if (!brokerInstance.save(flush: true)) {
                render(view: "create", model: [brokerSoftwareInstance: brokerSoftwareInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'brokerSoftware.label', default: 'brokerSoftware'), brokerSoftwareInstance.id])
            redirect(action: "list", id: brokerInstance.id)
        }
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
        redirect(action: "list", id: brokerSoftwareInstance.broker.id)
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
