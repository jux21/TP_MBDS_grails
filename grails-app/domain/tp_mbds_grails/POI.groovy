package tp_mbds_grails

class POI {

    static belongsTo = POIsGroup
    static hasMany = [groups:POIsGroup, images:POIGroupImage]
    String name;
    float latitude;
    float longitude;
    String description;

    static constraints = {
        name blank: false
        latitude nullable: true
        longitude nullable: true
        description nullable: true
    }
}
