package tp_mbds_grails

class Group {

    String name

    static hasMany = [pois:POI]

    static constraints = {
       nom blank: false
    }

}
