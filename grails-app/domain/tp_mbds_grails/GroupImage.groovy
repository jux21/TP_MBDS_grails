package tp_mbds_grails

class GroupImage {

    static belongsTo = [POIsGroup]
    String path

    static constraints = {
        path nullable: true
    }
}
