package alms

class Term {
    String      title
    Curriculum  curriculum
    Date        startDate
    Long        price

    static belongsTo = [curriculum:Curriculum]

    static hasMany = [events:Event,discounts:Discount]

    static searchable = true

    static constraints = {
        title(nullable: false,blank: false)
        price(nullable: false)
    }

    def String toString(){
       "$title-$startDate-$price"
    }
}
