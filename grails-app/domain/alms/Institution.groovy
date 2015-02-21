package alms

class Institution {
    String	name
    String	nationalCode
    String	registerNumber
    String	address
    String	phone
    String	fax
    String	email
    static hasMany = [person:Person]

    static constraints = {
        name(nullable: false)
        nationalCode(nullable: false)
        registerNumber(nullable: false)
        address(nullable: false)
        phone(nullable: false)
        fax(nullable: false)
        email(nullable: false)
    }
}
