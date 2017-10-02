package tp_mbds_grails

import grails.config.Config
import grails.core.support.GrailsConfigurationAware
import org.springframework.security.access.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder

class LoginController extends grails.plugin.springsecurity.LoginController implements GrailsConfigurationAware {


    def auth() {
        def conf = getConf()

        if (springSecurityService.isLoggedIn()) {
            redirect uri: conf.successHandler.defaultTargetUrl
            return
        }

        String postUrl = request.contextPath + conf.apf.filterProcessesUrl
        render view: 'auth', model: [postUrl: postUrl,
                                     rememberMeParameter: conf.rememberMe.parameter,
                                     usernameParameter: conf.apf.usernameParameter,
                                     passwordParameter: conf.apf.passwordParameter,
                                     gspLayout: conf.gsp.layoutAuth,
                                     params: params]

    }


    @Override
    void setConfiguration(Config co) {

    }
}
