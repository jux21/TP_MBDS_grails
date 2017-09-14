package tp_mbds_grails

class POI {

   // def location = [];
   // def imageListPath = [];
   // String description;
    static belongsTo = POIsGroup
    static hasMany = [groups:POIsGroup]
    String name;

    static constraints = {
        name blank: false
    }
}
