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
        respond POIImage.list(params), model:[POIGroupImageCount: POIImage.count()]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def show(POIImage POIGroupImage) {
        respond POIGroupImage
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        respond new POIImage(params)
    }

    @Secured(['ROLE_ADMIN'])
    @Transactional
    def save(POIImage POIGroupImage) {
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
                flash.message = message(code: 'default.created.message', args: [message(code: 'POIImage.label', default: 'POIImage'), POIGroupImage.id])
                redirect POIGroupImage
            }
            '*' { respond POIGroupImage, [status: CREATED] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit(POIImage POIGroupImage) {
        respond POIGroupImage
    }

    @Secured(['ROLE_ADMIN'])
    @Transactional
    def update(POIImage POIGroupImage) {
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
                flash.message = message(code: 'default.updated.message', args: [message(code: 'POIImage.label', default: 'POIImage'), POIGroupImage.id])
                redirect POIGroupImage
            }
            '*'{ respond POIGroupImage, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN'])
    @Transactional
    def delete(POIImage POIGroupImage) {

        if (POIGroupImage == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        POIGroupImage.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'POIImage.label', default: 'POIImage'), POIGroupImage.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'POIImage.label', default: 'POIImage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
