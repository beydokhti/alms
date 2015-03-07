package alms

class Institution {
    String	name
    String	nationalCode
    String	registerNumber
    //todo mtb add address
    String	address
    String	fax
    String	email
    static hasMany = [person:Person,phone:String]

    static searchable = true

    static constraints = {
        name(nullable: false,blank:false)
        nationalCode(nullable: false,blank:false)
        registerNumber(nullable: false,blank:false)
        address(nullable: true)
        fax(nullable: true)
        email(nullable: true)
    }
}
