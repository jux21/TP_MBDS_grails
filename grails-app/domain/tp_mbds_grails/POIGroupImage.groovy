package tp_mbds_grails

class POIGroupImage {

    static belongsTo = [POI, POIsGroup]
    String path

    static constraints = {
        path nullable: true
    }
}
