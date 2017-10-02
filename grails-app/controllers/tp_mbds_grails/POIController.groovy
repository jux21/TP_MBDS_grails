package tp_mbds_grails

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class POIController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def list() {
        render view:"/POI/list",model:[pois:POI.list(fetch:[groups:"eager", images:"eager"])]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond POI.list(params), model:[POICount: POI.count()]
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def show(POI POI) {
        respond POI
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODER'])
    def create() {
        respond new POI(params)
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    @Transactional
    def save(POI POI) {

        if (POI == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (POI.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond POI.errors, view:'create'
            return
        }

        for (POIsGroup groupe : POI.groups) {
            //POIsGroup groupe = POIsGroup.getId(groups[i])
            POI.addToGroups(groupe)

        }

        if(params.image != "") {
            def image = new POIImage(path: params.image)
            POI.addToImages(image)
            params.fileupload.transferTo(new java.io.File(grailsApplication.config.updateFolder + params.image))
        }


        POI.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'POI.label', default: 'POI'), POI.id])
                redirect POI
            }
            '*' { respond POI, [status: CREATED] }
        }
    }


    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    def edit(POI POI) {
        respond POI, model:[groups:POIsGroup.list()]
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    @Transactional
    def update(POI POI, def groups) {
        if (POI == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (POI.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond POI.errors, view:'edit'
            return
        }

        POI.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'POI.label', default: 'POI'), POI.id])
                redirect POI
            }
            '*'{ respond POI, [status: OK] }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    @Transactional
    def delete(POI POI) {

        if (POI == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        def groups = POIsGroup.list()

        def deletedPOIName = POI.getName()
        for (POIsGroup group : groups) {
            for (POI poiD : group.pois.find()) {
                def deletedPOI = group.pois.find { it.name == deletedPOIName }
                if (deletedPOI != null) {
                    group.removeFromPois(deletedPOI)
                }
            }
        }


        POI.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'POI.label', default: 'POI'), POI.id])
                redirect action:"list", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['IS_AUTHENTICATED_FULLY'])
    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'POI.label', default: 'POI'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
