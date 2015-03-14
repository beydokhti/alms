package alms

import grails.converters.JSON
import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser

class UserController {

    def springSecurityService
    def queryService

    def index() {}

    def changePassword() {
    }

    def save() {
        println(params)
        if (params.newPassword == params.repeatPassword) {
            def loginUser = springSecurityService.getPrincipal()
            if (loginUser instanceof GrailsUser) {
                def user = User.findByUsername(loginUser.username)
                //todo mtb compare old password
//                if (user.password==params.oldPassword){
                user.password = params.newPassword
                user.save()
//                }else{
//                    flash.message = message(code: 'nok.old.password.label', default: 'old Password nok')
//                    return redirect(action: "changePassword")
//                }
                //todo mtb message is incorrect
                flash.message = message(code: 'ok.password.label', default: 'password ok')
                return redirect(action: "changePassword")
            }
        } else {
            flash.message = message(code: 'nok.new.password.label', default: 'new password mismatched')
            return redirect(action: "changePassword")
        }
    }

    def list() {

    }

    def jsonList(){
        def columns = ['action', 'username','enabled','accountExpired','accountLocked','passwordExpired']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = Exam.count()
        dataTableResponse.iTotalDisplayRecords = dataTableResponse.iTotalRecords
//        dataTableResponse.sEcho = Integer.valueOf(params.sEcho)
        def list

        if (params.containsKey('sSearch') &&  params.get('sSearch')) {
            def options = [:]
            options.max = Math.min(params.iDisplayLength ? params.int('iDisplayLength') : 10, 100)
            options.offset = params.int("iDisplayStart")
            def sortIndex = params.int("iSortCol_0")
            if (sortIndex > 0) {
                options.order = params["sSortDir_0"]
                options.sort = columns[sortIndex]
            }
            def result = User.search("*${params.sSearch}*", options)
            list = result.results
        } else {
            def query = queryService.listQuery(params + [columns: columns])
            list = User.createCriteria().list(query)
        }
        def array = list.collect { User  it ->
            def action ="<a href='${g.createLink(action: "edit",controller: "user", params: [id: it.id])}'>${message(code: "edit", default:"Edit")}</a>"
            [action, it.username,it.enabled,it.accountExpired,it.accountLocked,it.passwordExpired]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }
}
