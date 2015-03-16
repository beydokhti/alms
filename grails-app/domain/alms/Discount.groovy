package alms

class Discount {
    String  title
    PersonType  personType
    Short   discountPercentage
    Date    startDate
    Date    endDate
    Term    term

    static belongsTo = [term:Term]

    static constraints = {
        personType(nullable: false)
        title(nullable: false,blank: false)

    }
}
