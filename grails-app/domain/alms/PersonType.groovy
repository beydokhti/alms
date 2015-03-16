package alms

class PersonType {
    String  personType

    static constraints = {
        personType(nullable: false,blank: false)
    }
}
