package alms

class OpenExam {
    String      title
//    Date    examDate
    Date        examStartTime
    Date        examEndTime
    String      venue
    Long price

    static hasMany = [discounts: Discount]

    static searchable = true

    static constraints = {
        title(nullable: false, blank: false)
        price(nullable: false)
//        examDate(nullable: false)
    }

}
