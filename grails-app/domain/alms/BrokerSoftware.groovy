package alms

class BrokerSoftware {

    String	title1
    String	title2
    String	companyName
    String	contractType


    static constraints = {
        title1(nullable: false)
        title2(nullable: false)
        companyName(nullable: false)
        contractType(nullable: false, inList: ['Buy' , 'Rent'])

    }
}
