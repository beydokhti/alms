package alms

class InstitutionMember {

    Person      person
    Institution institution
    Date	    startDate
    Date	    endDate
    Boolean     isActive

    static belongsTo = [institution: Institution, person: Person]

    static searchable = true

    static constraints = {
        startDate(nullable: true)
        endDate(nullable: true)
        isActive(nullable: false,default:true)

    }
}
