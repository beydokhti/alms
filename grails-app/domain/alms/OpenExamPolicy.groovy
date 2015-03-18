package alms

class OpenExamPolicy {
    String      title
    PersonGroup personGroup
    Long        price
    Short       discountPercentage
    OpenExam    openExam

    static belongsTo = [openExam: OpenExam]

    static constraints = {
        title(nullable: false, blank: false)
        personGroup(nullable: false)
        discountPercentage(nullable: true)
        price(nullable: true)
    }
}
