package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class BrokerLicenseController {

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
        def columns = ['action', 'displayOrder', 'title1', 'title2', 'hasLicense', 'licenseNumber', 'licenseDate', 'licenseExpiry']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = BrokerLicense.count()
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
            def result = BrokerLicense.search {
                must(term('$/BrokerLicense/broker/id', params.long("brokerId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("broker.id", params.long("brokerId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = BrokerLicense.createCriteria().list(query)
        }

        def array = list.collect { BrokerLicense it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            println(action)
            [action, it.displayOrder, it.title1, it.title2, it.hasLicense, it.licenseNumber, it.licenseDate, it.licenseExpiry]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [brokerLicenseInstance: new BrokerLicense(params), brokerId: params.id]
    }

    def save() {
        println(params)
        def brokerInstance = Broker.get(params.brokerId)
        //todo handle if brokerInstance is null
        if (brokerInstance) {

            def brokerLicenseInstance = new BrokerLicense(params)
            brokerInstance.addToBrokerLicenses(brokerLicenseInstance)
            if (!brokerInstance.save(flush: true)) {
                render(view: "create", model: [brokerLicenseInstance: brokerLicenseInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'brokerLicense.label', default: 'brokerLicense'), brokerLicenseInstance.id])
            redirect(action: "list", id: brokerInstance.id)
        }
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
                render(view: "edit", model: [id: brokerLicenseInstance.id])
                return
            }
        }

        brokerLicenseInstance.properties = params

        if (!brokerLicenseInstance.save(flush: true)) {
            render(view: "edit", model: [id: brokerLicenseInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerLicense.label', default: 'BrokerLicense'), brokerLicenseInstance.id])
        redirect(action: "list", id: brokerLicenseInstance.broker.id)
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
