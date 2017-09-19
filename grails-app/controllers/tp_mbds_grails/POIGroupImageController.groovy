package tp_mbds_grails

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class POIGroupImageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond POIGroupImage.list(params), model:[POIGroupImageCount: POIGroupImage.count()]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def show(POIGroupImage POIGroupImage) {
        respond POIGroupImage
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new POIGroupImage(params)
    }

    @Secured(['ROLE_ADMIN'])
    @Transactional
    def save(POIGroupImage POIGroupImage) {
        if (POIGroupImage == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (POIGroupImage.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond POIGroupImage.errors, view:'create'
            return
        }

        POIGroupImage.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'POIGroupImage.label', default: 'POIGroupImage'), POIGroupImage.id])
                redirect POIGroupImage
            }
            '*' { respond POIGroupImage, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(POIGroupImage POIGroupImage) {
        respond POIGroupImage
    }

    @Secured(['ROLE_ADMIN'])
    @Transactional
    def update(POIGroupImage POIGroupImage) {
        if (POIGroupImage == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (POIGroupImage.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond POIGroupImage.errors, view:'edit'
            return
        }

        POIGroupImage.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'POIGroupImage.label', default: 'POIGroupImage'), POIGroupImage.id])
                redirect POIGroupImage
            }
            '*'{ respond POIGroupImage, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(POIGroupImage POIGroupImage) {

        if (POIGroupImage == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        POIGroupImage.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'POIGroupImage.label', default: 'POIGroupImage'), POIGroupImage.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'POIGroupImage.label', default: 'POIGroupImage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
