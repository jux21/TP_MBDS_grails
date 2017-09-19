package tp_mbds_grails

import grails.config.Config
import grails.core.support.GrailsConfigurationAware
import org.springframework.security.access.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder

class LoginController extends grails.plugin.springsecurity.LoginController implements GrailsConfigurationAware {

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    def index() {
        def roles = SecurityContextHolder.getContext().getAuthentication().getAuthorities()

        for(def role in roles)
        {
            if(role.getAuthority()=="ROLE_ADMIN")
                render(view: "indexAdmin")
            else
                render(view: "indexModerator")
        }


    }

    // TODO écrire contenu de auth et de auth.GSP
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
                                     gspLayout: conf.gsp.layoutAuth]

    }



    def login() {
        render(view: "indexAdmin")
    }

    @Override
    void setConfiguration(Config co) {

    }
}
