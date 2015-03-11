package alms

class Discount {
    String  title
    String  personType
    Short   discountPercentage
    Date    startDate
    Date    endDate
    Event   event

    static belongsTo = [event:Event]

    static constraints = {
        personType(nullable: false,inList: ['independent','broker','institution'])
        personType(nullable: false)
        title(nullable: false,blank: false)

    }
}
