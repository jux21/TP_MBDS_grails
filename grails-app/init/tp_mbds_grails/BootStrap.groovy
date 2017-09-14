package tp_mbds_grails


class BootStrap {

    def init = { servletContext ->

        //  if(Group.count == 0) {
        POIsGroup group = new POIsGroup(name :'my first group')
                .addToPois(new POI(name:'my first poi'))
                .save()
        // }
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
        
    }
    def destroy = {
    }
}
