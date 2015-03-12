package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class BrokerTradingStationController {

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
        def columns = ['action','city','stationType','activities','trader','phone','address']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = BrokerTradingStation.count()
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
            def result = BrokerTradingStation.search {
                must(term('$/BrokerTradingStation/broker/id', params.long("brokerId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("broker.id", params.long("brokerId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = BrokerTradingStation.createCriteria().list(query)
        }

        def array = list.collect { BrokerTradingStation it ->
            def action ="<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            println(action)
            [action,it.city.toString(),message(code:"brokerTradingStation.stationType."+it.stationType,defaault:it.stationType),it.activities,it.trader,it.phone,it.address]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [brokerTradingStationInstance: new BrokerTradingStation(params),brokerId:params.id]
    }

    def save() {
        println(params)
        def brokerInstance=Broker.get(params.brokerId)
        //todo handle if brokerInstance is null
        if (brokerInstance) {

            def brokerTradingStationInstance = new BrokerTradingStation(params)
            brokerInstance.addToBrokerTradingStations(brokerTradingStationInstance)
            if (!brokerInstance.save(flush: true)) {
                render(view: "create", model: [brokerTradingStationInstance: brokerTradingStationInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'brokerTradingStation.label', default: 'brokerTradingStation'), brokerTradingStationInstance.id])
            redirect(action: "list", id: brokerInstance.id)
        }

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
        redirect(action: "list", id: brokerTradingStationInstance.broker.id)
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
