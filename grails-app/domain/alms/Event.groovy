package alms

import java.awt.Color

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
        price(nullable: false,default:0)
    }
}
