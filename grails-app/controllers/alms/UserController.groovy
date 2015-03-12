package alms

import org.codehaus.groovy.grails.plugins.springsecurity.GrailsUser

class UserController {

    def springSecurityService

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
}
