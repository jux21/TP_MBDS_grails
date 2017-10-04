package tp_mbds_grails
//Debug apache tomcat : netstat -aon | find ":80" | find "LISTENING"

import java.util.Random

class BootStrap {

    def init = { servletContext ->


        SecUser adminUser = new SecUser(username: "IamRoot", password: "root", enabled: true).save(flush:true)
        SecUser adminUser2 = new SecUser(username: "IamRoot2", password: "root", enabled: true).save(flush:true)
        SecUser adminUser3 = new SecUser(username: "IamRoot3", password: "root", enabled: true).save(flush:true)
        SecUser adminUser4 = new SecUser(username: "IamRoot4", password: "root", enabled: true).save(flush:true)
        SecUser adminUser5 = new SecUser(username: "IamRoot5", password: "root", enabled: true).save(flush:true)
        SecUser moderatorUser = new SecUser(username: "IamModerator", password: "moderator", enabled: true).save(flush:true)
        SecUser moderatorUser2 = new SecUser(username: "IamModerator2", password: "moderator", enabled: true).save(flush:true)
        SecUser moderatorUser3 = new SecUser(username: "IamModerator3", password: "moderator", enabled: true).save(flush:true)

        SecRole roleAdmin = new SecRole(authority: 'ROLE_ADMIN').save(flush:true)
        SecRole roleModer = new SecRole(authority: 'ROLE_MODER').save(flush:true)
        SecRole roleUser = new SecRole(authority: 'ROLE_USER').save(flush:true)

        SecUserSecRole.create(adminUser,roleAdmin,true)
        SecUserSecRole.create(adminUser,roleModer,true)
        SecUserSecRole.create(adminUser,roleUser,true)

        SecUserSecRole.create(adminUser2,roleAdmin,true)
        SecUserSecRole.create(adminUser2,roleModer,true)
        SecUserSecRole.create(adminUser2,roleUser,true)

        SecUserSecRole.create(adminUser3,roleAdmin,true)
        SecUserSecRole.create(adminUser3,roleModer,true)

        SecUserSecRole.create(adminUser4,roleAdmin,true)

        SecUserSecRole.create(adminUser5,roleAdmin,true)
        SecUserSecRole.create(adminUser5,roleUser,true)

        SecUserSecRole.create(moderatorUser,roleModer,true)
        SecUserSecRole.create(moderatorUser,roleUser,true)

        SecUserSecRole.create(moderatorUser2,roleModer,true)
        SecUserSecRole.create(moderatorUser2,roleUser,true)

        SecUserSecRole.create(moderatorUser3,roleModer,true)


        SecUser utilUser
        for (def i = 0; i < 5; i++) {
            utilUser = new SecUser(username: "IamUser"+i, password: "user", enabled: true).save(flush:true)
            SecUserSecRole.create(utilUser,roleUser,true)
            utilUser = null
        }



        println(SecUser.count())
        println(SecRole.count())
        println(SecUserSecRole.count())

        POI myfirstpoi
        POIImage myfirstimage
        POIsGroup group
        GroupImage mysecondimage
        def lat
        def lng
        def rand

        for (def i = 0; i <10; i++) {

            //10 groups are created
            group = new POIsGroup(name :'my group'+i)

            for (def j = 0; j <10; j++) {

                rand = new Random()
                int max = 9

                lat =  43.62+(rand.nextInt(max+1)/1000)
                lng = 7.06+(rand.nextInt(max+1)/1000)

                //10 POI are created per groups
                myfirstimage = new POIImage(path: 'apple-touch-icon-retina.png')
                myfirstpoi = new POI(name: 'my poi'+i+'-' + j, latitude: lat, longitude: lng, description: 'my poi description' + j)
                myfirstpoi.addToImages(myfirstimage)
                group.addToPois(myfirstpoi).save()
            }

            mysecondimage = new GroupImage(path: 'apple-touch-icon-retina.png')
            group.addToImages(mysecondimage).save()

            myfirstimage = null
            myfirstpoi = null
            group = null

        }




        
    }
    def destroy = {
    }
}
