package tp_mbds_grails

class BootStrap {

    def init = { servletContext ->
      //  if(Group.count == 0) {
        POIsGroup group = new POIsGroup(name :'my first group')
            .addToPois(new POI(name:'my first poi'))
            .save()
       // }
    }
    def destroy = {
    }
}
