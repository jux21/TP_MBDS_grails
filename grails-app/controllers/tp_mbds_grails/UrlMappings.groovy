package tp_mbds_grails

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "/index"(view:"/index")
        "/login"(view:"/index")

        "/POI" (controller:"POI", action:"list" )
        "/POI/index" (controller:"POI", action:"list" )

        "/POIsGroup" (controller:"POIsGroup", action:"list" )
        "/POIsGroup/index" (controller:"POIsGroup", action:"list" )

        "/secUser" (controller:"secUser", action:"list" )
        "/secUser/index" (controller:"secUser", action:"list" )

        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
