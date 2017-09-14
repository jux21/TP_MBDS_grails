package tp_mbds_grails

class POIGroupImage {

    static belongsTo = POI
    String path

    static constraints = {
        path nullable: true
    }
}
