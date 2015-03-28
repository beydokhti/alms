package alms

class OpenExamResult {

    OpenExam    openExam
    Person      person
    Short       correctAnswer
    Short       wrongAnswer
    Short       finalScore
    //todo mtb add result date

    static searchable = true

    static constraints = {
        openExam(nullable: false)
        person(nullable: false)
        finalScore(nullable: false)
    }
}
