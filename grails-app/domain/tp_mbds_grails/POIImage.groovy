package tp_mbds_grails

class POIImage {

    static belongsTo = [POI]
    String path

    static constraints = {
        path nullable: true
    }
}
