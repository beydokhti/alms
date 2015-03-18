package alms

class RegisteredOpenExam {
    Person      person
    OpenExam    openExam

    static belongsTo = [person: Person, openExam: OpenExam]

    static constraints = {
        person(nullable: true)
        openExam(nullable: true)
    }
}
