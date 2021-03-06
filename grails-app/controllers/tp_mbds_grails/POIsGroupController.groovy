package tp_mbds_grails

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class POIsGroupController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def list() {
        render view:"/POIsGroup/list",model:[poisgroups:POIsGroup.list(fetch:[pois:"eager", images:"eager"])]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond POIsGroup.list(params), model:[POIsGroupCount: POIsGroup.count()]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def show(POIsGroup POIsGroup) {
        respond POIsGroup
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    def create() {
        respond new POIsGroup(params)
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    @Transactional
    def save(POIsGroup POIsGroup) {
        if (POIsGroup == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (POIsGroup.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond POIsGroup.errors, view:'create'
            return
        }


        if(params.image != "") {
            def image = new GroupImage(path: params.image)
            POIsGroup.addToImages(image)
            params.fileupload.transferTo(new java.io.File(grailsApplication.config.updateFolder + params.image))
        }

        POIsGroup.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'POIsGroup.label', default: 'POIsGroup'), POIsGroup.id])
                redirect POIsGroup
            }
            '*' { respond POIsGroup, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    def edit(POIsGroup POIsGroup) {
        respond POIsGroup, model:[pois:POI.list(), nbPois: POIsGroup.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    @Transactional
    def update(POIsGroup POIsGroup) {
        if (POIsGroup == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (POIsGroup.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond POIsGroup.errors, view:'edit'
            return
        }


        if(params.image != "") {
            def image = new GroupImage(path: params.image)
            POIsGroup.addToImages(image)
            params.fileupload.transferTo(new java.io.File(grailsApplication.config.updateFolder + params.image))
        }

        POIsGroup.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'POIsGroup.label', default: 'POIsGroup'), POIsGroup.id])
                redirect POIsGroup
            }
            '*'{ respond POIsGroup, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    @Transactional
    def delete(POIsGroup POIsGroup) {

        if (POIsGroup == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }


        POIsGroup.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'POIsGroup.label', default: 'POIsGroup'), POIsGroup.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'POIsGroup.label', default: 'POIsGroup'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
