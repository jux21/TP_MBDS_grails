package tp_mbds_grails

class POIsGroup {

    static hasMany = [pois:POI, images:POIGroupImage]
    String name

    static constraints = {
        name blank: false
    }

}
