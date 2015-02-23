package alms

class Broker {

    String brokerPersianName
    String brokerLatinName

    Date registerDate
    String registerNo
    String registerLocation

    Date seoRegisterDate
    String seoRegisterNo

    String clubMembershipNo
    Date clubMembershipDate

    Long registeredCapital
    Long paidCapital
    Long sharesNumber

    Byte financialYearEndMonth
    Byte financialYearEndDay

    // todo: personnel number should be auto calculated

    String nationalCode
    String economicCode

    String centralOfficeAddress
    String centralOfficePostalCode

    String POBox

    String website
    String email

    String tseRank
    Byte tseOrdinaryPoint
    Byte tseEncouragingPoint

    String imeRank
    Byte imeOrdinaryPoint
    Byte imeEncouragingPoint


    static hasMany = [centralOfficePhones   : String, centralOfficeFaxes: String, brokerLicenses: BrokerLicense,
                      brokerShareholders    : BrokerShareholder, brokerBranches: BrokerBranch,
                      brokerInvestmentFounds: BrokerInvestmentFund, brokerPortfolios: BrokerPortfolio,
                      brokerMembers         : BrokerMember, institutions: Institution, brokerTradingStations: BrokerTradingStation,
                      brokerSoftware        : BrokerSoftware]

    static searchable = true

    static constraints = {
        brokerPersianName(nullable: false)
        brokerLatinName(nullable: false)
        registerDate(nullable: false)
        registerNo(nullable: false)
        registerLocation(nullable: false)
        seoRegisterDate(nullable: false)
        seoRegisterNo(nullable: false)
        clubMembershipNo(nullable: false)
        clubMembershipDate(nullable: false)
        registeredCapital(nullable: false)
        paidCapital(nullable: false)
        sharesNumber(nullable: false)
        financialYearEndMonth(nullable: false)
        financialYearEndDay(nullable: false)
        nationalCode(nullable: false)
        economicCode(nullable: false)
        centralOfficeAddress(nullable: false)
        centralOfficePostalCode(nullable: false)
        POBox(nullable: false)
        website(nullable: false)
        email(nullable: false)
        tseRank(nullable: false)
        tseOrdinaryPoint(nullable: true)
        tseEncouragingPoint(nullable: true)
        imeRank(nullable: false)
        imeOrdinaryPoint(nullable: true)
        imeEncouragingPoint(nullable: true)
    }
}
