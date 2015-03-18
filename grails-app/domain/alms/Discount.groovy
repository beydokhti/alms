package alms

class Discount {
    String  title
    PersonGroup  personGroup
    Short   discountPercentage
    Date    startDate
    Date    endDate
    Term    term

    static belongsTo = [term:Term]

    static constraints = {
        personGroup(nullable: false)
        title(nullable: false,blank: false)

    }
}
