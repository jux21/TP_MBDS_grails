package tp_mbds_grails

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/auth") // Page d'accueil du projet
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
