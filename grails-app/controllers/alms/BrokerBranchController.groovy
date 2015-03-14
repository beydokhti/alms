package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class BrokerBranchController {

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
        }else {
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
        def columns = ['action','city','branchType','representativePerson','personnelCount','tseStock','imeStock','energyStock','imeFuture','tseFuture','mutualFundAdmin']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = BrokerBranch.count()
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
            def result = BrokerBranch.search {
                must(term('$/BrokerBranch/broker/id', params.long("brokerId")))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("broker.id", params.long("brokerId"))
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = BrokerBranch.createCriteria().list(query)
        }

        def array = list.collect { BrokerBranch it ->
            def action ="<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>"
            println(action)
            [action,it.city.toString(),message(code:"brokerBranch.branchType."+it.branchType, default:  it.branchType),it.representativePerson,it.personnelCount,it.tseStock,it.imeStock,it.energyStock,it.imeFuture,it.tseFuture,it.mutualFundAdmin]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [brokerBranchInstance: new BrokerBranch(params),brokerId:params.id]
    }

    def save() {
        println(params)
        def brokerInstance=Broker.get(params.brokerId)
        //todo handle if brokerInstance is null
        if (brokerInstance) {

            def brokerBranchInstance = new BrokerBranch(params)
            brokerInstance.addToBrokerBranches(brokerBranchInstance)
            if (!brokerInstance.save(flush: true)) {
                render(view: "create", model: [brokerBranchInstance: brokerBranchInstance])
                return
            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'brokerBranch.label', default: 'BrokerBranch'), brokerBranchInstance.id])
            redirect(action: "list", id: brokerInstance.id)
        }
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
                render(view: "edit", model: [id: brokerBranchInstance.id])
                return
            }
        }

        brokerBranchInstance.properties = params

        if (!brokerBranchInstance.save(flush: true)) {
            render(view: "edit", model: [id: brokerBranchInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'brokerBranch.label', default: 'BrokerBranch'), brokerBranchInstance.id])
        redirect(action: "list", id: brokerBranchInstance.broker.id)
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
