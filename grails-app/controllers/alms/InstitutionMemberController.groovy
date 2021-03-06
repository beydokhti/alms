package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser
import org.springframework.dao.DataIntegrityViolationException

class InstitutionMemberController {

    def springSecurityService
    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        def institutionIns
        if (params.id) {
            institutionIns = Institution.get(params.id)
        } else {
            def loginUser = springSecurityService.getPrincipal()
            if (loginUser instanceof GrailsUser) {
                def user = User.findByUsername(loginUser.username)

                institutionIns = Institution.get(user.id)
                if (!institutionIns) {
                    return
                }
            }
        }
        if (institutionIns) {
            [institutionId: institutionIns.id]
        }
    }

    def jsonList() {
        def columns = ['action', 'name', 'lastName', 'sex', 'startDate', 'degree', 'field', 'dateOfBirth', 'nationalCode', 'mobile', 'email']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = InstitutionMember.count()
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
            def result = InstitutionMember.search {
                must(term('$/InstitutionMember/institution/id', params.long("institutionId")))
                must(term('$/InstitutionMember/isActive', true))
                must(queryString("*${params.sSearch}*"))
            }

            list = result.results
        } else {
            def query_criteria = {
                eq("institution.id", params.long("institutionId"))
                eq("isActive", true)
            }
            def query = queryService.decorate(params + [columns: columns], query_criteria)
            list = InstitutionMember.createCriteria().list(query)
        }

        def array = list.collect { InstitutionMember it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>" +
                    "<a href='${g.createLink(controller: "obtainedCertificate", action: "list", params: [id: it.person.id])}'>${message(code: "certificate", default: "Cer")}</a>"
            println(action)
            [action, it.person.name, it.person.lastName, message(code: "person.sex." + it.person.sex, default: it.person.sex),
             it.startDate, message(code: "person.degree." + it.person.degree, default: it.person.degree),
             message(code: "person.field." + it.person.field, it.person.field), it.person.dateOfBirth, it.person.nationalCode,
             it.person.mobile, it.person.email]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [institutionMemberInstance: new InstitutionMember(params), institutionId: params.id]
    }

    def save() {
        println(params)
        def institutionInstance = Institution.get(params.institutionId)
        //todo handle if institutionInstance is null
        if (institutionInstance) {

            def institutionMemberInstance = new InstitutionMember(params)
            institutionMemberInstance.isActive = true
            institutionMemberInstance.person.username = institutionMemberInstance.person.nationalCode
            //todo mtb change password
            institutionMemberInstance.person.password = "password123"
            institutionMemberInstance.person.enabled = true

            def institutionMemberList = InstitutionMember.findAllByPerson(institutionMemberInstance.person)
            institutionMemberList.each { member ->
                if (!member.endDate) {
                    member.endDate = institutionMemberInstance.startDate
                }
                member.isActive = false
                member.save()
            }

            def brokerMemberList = BrokerMember.findAllByPerson(institutionMemberInstance.person)
            brokerMemberList.each { member ->
                if (!member.endDate) {
                    member.endDate = institutionMemberInstance.startDate
                }
                member.isActive = false
                member.save()
            }

            institutionInstance.addToInstitutionMembers(institutionMemberInstance)
//            if (!institutionInstance.save(flush: true)) {
//                render(view: "create", model: [institutionMemberInstance: institutionMemberInstance])
//                return
//            }

            flash.message = message(code: 'default.created.message', args: [message(code: 'institutionMember.label', default: 'institutionMember'), institutionMemberInstance.id])
            redirect(action: "list", id: institutionInstance.id)
        }

    }

    def saveAll() {
        println(params)
        def institutionInstance = Institution.get(params.institutionId)
        //todo handle if institutionInstance is null
        if (institutionInstance) {

            def institutionMemberInstance = new InstitutionMember(params)
            def person = new Person(params)
            def nc = person.nationalCode
            if (!Person.findAllByNationalCode(params.nationalCode) && !User.findByUsername(person.nationalCode)) {
                person.username = person.nationalCode
                //todo mtb change password
                person.password = "password123"
                person.enabled = true
                person.save()

                def personRole = Role.findByAuthority("PersonRole")
                UserRole.findByUser(person) ?: UserRole.create(person, personRole)

                institutionMemberInstance.person = person
                institutionMemberInstance.isActive = true
                institutionInstance.addToInstitutionMembers(institutionMemberInstance)
                if (!institutionInstance.save(flush: true)) {
                    render(view: "create", model: [institutionMemberInstance: institutionMemberInstance])
                    return
                }

                flash.message = message(code: 'default.created.message', args: [message(code: 'institutionMember.label', default: 'institutionMember'), institutionMemberInstance.id])
                redirect(action: "list", id: institutionInstance.id)
            } else {
                flash.message = message(code: 'institutionMember.unique.nationalCode.message', default: 'National Id should be unique ')
                render(view: "create", model: [institutionInstance: institutionInstance])
                return
            }
        }

    }

    def show(Long id) {
        def institutionMemberInstance = InstitutionMember.get(id)
        if (!institutionMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institutionMember.label', default: 'InstitutionMember'), id])
            redirect(action: "list")
            return
        }

        [institutionMemberInstance: institutionMemberInstance]
    }

    def edit(Long id) {
        def institutionMemberInstance = InstitutionMember.get(id)
        if (!institutionMemberInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institutionMember.label', default: 'InstitutionMember'), id])
            redirect(action: "list")
            return
        }

        [institutionMemberInstance: institutionMemberInstance]
    }

    def update(Long id, Long version) {
        def institutionMemberInstance = InstitutionMember.get(id)
        if (!institutionMemberInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institutionMember.label', default: 'InstitutionMember'), id])
//            redirect(action: "list")
            return
        }

        if (version != null) {
            if (institutionMemberInstance.version > version) {
                institutionMemberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'institutionMember.label', default: 'InstitutionMember')] as Object[],
                        "Another user has updated this InstitutionMember while you were editing")
                render(view: "edit", model: [id: institutionMemberInstance.id])
                return
            }
        }

        institutionMemberInstance.properties = params

        if (!institutionMemberInstance.save(flush: true)) {
            render(view: "edit", model: [id: institutionMemberInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'institutionMember.label', default: 'InstitutionMember'), institutionMemberInstance.id])
        redirect(action: "list", id: institutionMemberInstance.institution.id)
    }

    def updateAll(Long id, Long version) {
        println(params)
        def institutionMemberInstance = InstitutionMember.get(id)
        if (!institutionMemberInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institutionMember.label', default: 'InstitutionMember'), id])
//            redirect(action: "list")
            return
        }

        if (version != null) {
            if (institutionMemberInstance.version > version) {
                institutionMemberInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'institutionMember.label', default: 'InstitutionMember')] as Object[],
                        "Another user has updated this InstitutionMember while you were editing")
                render(view: "edit", model: [id: institutionMemberInstance.id])
                return
            }
        }

        institutionMemberInstance.properties = params
        institutionMemberInstance.person.properties = params

        if (!institutionMemberInstance.save(flush: true)) {
            render(view: "edit", model: [id: institutionMemberInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'institutionMember.label', default: 'InstitutionMember'), institutionMemberInstance.id])
        redirect(action: "list", id: institutionMemberInstance.institution.id)
    }


    def delete(Long id) {
        def institutionMemberInstance = InstitutionMember.get(id)
        if (!institutionMemberInstance) {
//            flash.message = message(code: 'default.not.found.message', args: [message(code: 'institutionMember.label', default: 'InstitutionMember'), id])
//            redirect(action: "list")
            return
        }

        try {
            institutionMemberInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'institutionMember.label', default: 'InstitutionMember'), id])
            redirect(action: "list", id: institutionMemberInstance.institution.id)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'institutionMember.label', default: 'InstitutionMember'), id])
            redirect(action: "list", id: institutionMemberInstance.institution.id)
        }
    }

    def Assign() {
        [institutionMemberInstance: new InstitutionMember(params), institutionId: params.id]
    }
}
