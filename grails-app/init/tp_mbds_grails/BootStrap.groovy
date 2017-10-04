package tp_mbds_grails
//Debug apache tomcat : netstat -aon | find ":80" | find "LISTENING"

import java.util.Random

class BootStrap {

    def init = { servletContext ->

        //Création de l'administrateur
        SecUser adminUser = new SecUser(username: "IamRoot", password: "root", enabled: true).save(flush:true)

        SecUser adminUser2 = new SecUser(username: "IamRoot2", password: "root", enabled: true).save(flush:true)
        SecUser moderatorUser2 = new SecUser(username: "IamModerator2", password: "moderator", enabled: true).save(flush:true)

        SecRole roleAdmin = new SecRole(authority: 'ROLE_ADMIN').save(flush:true)
        SecUserSecRole.create(adminUser,roleAdmin,true)

        SecUserSecRole.create(adminUser2,roleAdmin,true)
        SecUserSecRole.create(moderatorUser2,roleModer,true)

        //Création de 5 modérateur
        SecUser moderatorUser
        SecRole roleModer = new SecRole(authority: 'ROLE_MODER').save(flush:true)
        for (def i = 0; i < 5; i++) {
            moderatorUser = new SecUser(username: "IamModerator", password: "moderator", enabled: true).save(flush:true)
            SecUserSecRole.create(moderatorUser,roleModer,true)
            moderatorUser = null
        }

        //Création de 10 utilisateurs
        SecUser utilUser
        SecRole roleUser = new SecRole(authority: 'ROLE_USER').save(flush:true)
        for (def i = 0; i < 10; i++) {
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
