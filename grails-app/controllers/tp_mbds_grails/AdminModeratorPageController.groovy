package tp_mbds_grails

import org.springframework.security.access.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder

class AdminModeratorPageController {

    @Secured(['ROLE_ADMIN','ROLE_MODER'])
    def index() {
        //def user = SecurityContextHolder.getContext().getAuthentication().getPrincipal()
        def roles = SecurityContextHolder.getContext().getAuthentication().getAuthorities()

        for(def role in roles)
        {
            if(role.getAuthority()=="ROLE_ADMIN")
                render(view: "/login/indexAdmin")
            else
                render(view: "indexModerator")
        }


    }

    def ici() {
        println("IIIICCCCI")
    }



    //ROLE_ADMIN

    // sérialiser l'user en JSON
    // chercher son rôle dans sa variable authorities et faire des conditions
}
