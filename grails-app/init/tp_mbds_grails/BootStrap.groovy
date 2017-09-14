package tp_mbds_grails
//Debug apache tomcat : netstat -aon | find ":80" | find "LISTENING"

class BootStrap {

    def init = { servletContext ->


        SecUser adminUser = new SecUser(username: "adminUser", password: "adminUser", enabled: true).save(flush:true)
        SecUser moderatorUser = new SecUser(username: "moderatorUser", password: "moderatorUser", enabled: true).save(flush:true)
        SecUser utilUser = new SecUser(username: "utilUser", password: "utilUser", enabled: true).save(flush:true)
        SecRole roleAdmin = new SecRole(authority: 'ROLE_ADMIN').save(flush:true)
        SecRole roleModer = new SecRole(authority: 'ROLE_MODER').save(flush:true)
        SecRole roleUser = new SecRole(authority: 'ROLE_USER').save(flush:true)
        SecUserSecRole.create(adminUser,roleAdmin,true)
        SecUserSecRole.create(moderatorUser,roleModer,true)
        SecUserSecRole.create(utilUser,roleUser,true)

        println(SecUser.count())
        println(SecRole.count())
        println(SecUserSecRole.count())

        //  if(Group.count == 0) {
        POIGroupImage myfirstimage = new POIGroupImage(path:'apple-touch-icon-retina.png')
        POI myfirstpoi = new POI(name:'my first poi', latitude:0, longitude:0, description: 'my first poi description')
        myfirstpoi.addToImages(myfirstimage)
        POIsGroup group = new POIsGroup(name :'my first group').addToPois(myfirstpoi).save()
        // }
        
    }
    def destroy = {
    }
}
