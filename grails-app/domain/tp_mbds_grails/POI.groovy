package tp_mbds_grails

class POI {

    String nom;
    def location = [];
    def imageList = [];
    String description;
    static belongsTo = [group: Group]

    static constraints = {
        nom blank: false
    }
}
