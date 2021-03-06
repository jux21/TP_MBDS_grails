package tp_mbds_grails

import grails.plugin.springsecurity.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SecUserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def securityService

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    def list() {
        render view:"/secUser/list",model:[secUsers:SecUser.list()]
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SecUser.list(params), model:[secUserCount: SecUser.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    def show(SecUser secUser) {
        respond secUser
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new SecUser(params), model:[secroles:SecRole.list()]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def logOut()
    {
        SecurityContextHolder.getContext().setAuthentication(null);
        render view:"/login/auth"
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    @Transactional
    def save(SecUser secUser) {
        if (secUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (secUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond secUser.errors, view:'create'
            return
        }

        secUser.save flush:true

        for (def idRole : params.secroles) {
            SecRole role = SecRole.findById(idRole)
            SecUserSecRole.create(secUser,role,true)
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'secUser.label', default: 'SecUser'), secUser.id])
                redirect secUser
            }
            '*' { respond secUser, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    def edit(SecUser secUser) {
        respond secUser, model:[secroles:SecRole.list()]
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    @Transactional
    def update(SecUser secUser) {
        if (secUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (secUser.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond secUser.errors, view:'edit'
            return
        }



        secUser.save flush:true

        def newrolesId = params.secroles

        for (def idRole : params.secroles) {


        }

        if(newrolesId) {




            for (SecRole role : secUser.getAuthorities()) {  // Je parcours les anciens roles
                for (def i = 0; i < newrolesId.size(); i++) { // Pour chaque ancien role je parcours les nouveaux role

                    SecRole newrole = SecRole.findById(newrolesId[i])

                    SecUserSecRole.create(secUser,newrole,true)

                    if (newrolesId[i].toString() != role.id.toString()) {
                        // Si le nouveau role n'est pas dans les anciens je le vire
                        //SecUserSecRole.remove(secUser, role)

                        //println("je supprime " + role.id)
                    }




                    }
                }


                //SecUserSecRole.remove(secUser, role)
                //oldrolesId.push(role.id)

                // secUser.save flush:true


                println("\n")

        }

        newrolesId = null

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'secUser.label', default: 'SecUser'), secUser.id])
                redirect secUser
            }
            '*'{ respond secUser, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(SecUser secUser) {

        if (secUser == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        // Suppression role(s)
        for (SecRole role : secUser.getAuthorities()) {
            SecUserSecRole.remove(secUser, role)
        }



        secUser.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'secUser.label', default: 'SecUser'), secUser.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUser.label', default: 'SecUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
