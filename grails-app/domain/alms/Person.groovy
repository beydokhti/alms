package alms

class Person {
    String	name
    String	lastName
    String	sex
    String	degree
    String	field
    Date	dateOfBirth
    String	nationalCode
    String	mobile
    String	email

    static hasMany = [certificates:ObtainedCertificate]

    static constraints = {
        name(nullable: false,blank: false)
        lastName(nullable: false,blank: false)
        sex(nullable: false,inList: ['male','female'])
        degree(nullable: false,inList: ['PhD',
                                        'Master',
                                        'Expert',
                                        'PostDiploma',
                                        'Diploma',
                                        'NoDiploma'])
        field(nullable: false,inList: ['FinancialMng',
                                       'FinancialEng',
                                       'Accounting',
                                       'OtherMng',
                                       'Economy',
                                       'Banking',
                                       'EngAndTech',
                                       'Law',
                                       'Other'])
        dateOfBirth(nullable: false)
        nationalCode(nullable: false,blank: false)
        mobile(nullable:true)
        email(nullable: true)

    }
    String toString(){
        "$name $lastName"
    }

}
