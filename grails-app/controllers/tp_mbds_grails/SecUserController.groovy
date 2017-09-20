package tp_mbds_grails

import grails.plugin.springsecurity.annotation.Secured

class SecUserController {

    @Secured(['IS_AUTHENTICATED_FULLY'])
    def index() {
        render view:"/secUser/index"
    }
}
