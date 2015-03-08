package alms

/**
 * Created by MaryJoOon on 3/5/2015.
 */
class Course {
    String title

    static hasMany = [events:Event]

    static constraints = {
        title(nullable: false)
    }
}
