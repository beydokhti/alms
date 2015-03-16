package alms

class Curriculum {
    String      title
    Certificate certificate

    static hasMany = [terms: Term, courses: Course]

    static searchable = true

    static constraints = {
        title(nullable: false, blank: false)
    }
}
