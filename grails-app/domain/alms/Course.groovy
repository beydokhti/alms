package alms

/**
 * Created by MaryJoOon on 3/5/2015.
 */
class Course {
    String title
    Date start
    Date end
    String startTimezone
    String endTimezone
    String description
    String recurrenceID
    String recurrenceRule
    String recurrenceException
    String ownerID
    String isAllDay

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
        ownerID(nullable: true)
        isAllDay(nullable: true)
    }
}
