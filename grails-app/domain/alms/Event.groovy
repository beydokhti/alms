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
    Long   price
    Course course

    static belongsTo = [course:Course]

    static hasMany = [discount:Discount,exam:Exam]

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
        //todo mtb nullable:false
        price(nullable: true,default:0)
    }

    def String toString(){
        "$course.title-$title"
    }
}
