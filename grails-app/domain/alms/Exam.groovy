package alms

class Exam {
    String      title
//    Date    examDate
    Date        examStartTime
    Date        examEndTime
    String      venue
    Event event

    static belongsTo = [event: Event]

    static searchable = true

    static constraints = {
        title(nullable: false, blank: false)
//        examDate(nullable: false)
    }
}
