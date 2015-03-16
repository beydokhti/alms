package alms

class Event {
    String title
    Date start
    Date end
    String startTimezone
    String endTimezone
    String description
    String recurrenceID
    String recurrenceRule
    String recurrenceException
//    String ownerID
    String isAllDay
    Course course
    Term term

    static belongsTo = [course:Course,term:Term]

    static hasMany = [exam:Exam]

    static constraints = {
        title(nullable: false)
        start(nullable: true)
        end(nullable: true)
        startTimezone(nullable: true,blank:true)
        endTimezone(nullable: true,blank:true)
        description(nullable: true,blank:true)
        recurrenceID(nullable: true)
        recurrenceRule(nullable: true,blank:true)
        recurrenceException(nullable: true,blank:true)
        isAllDay(nullable: true)
    }

    def String toString(){
        "$course.title-$title"
    }
}
