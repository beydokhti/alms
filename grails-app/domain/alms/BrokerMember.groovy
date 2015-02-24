package alms

class BrokerMember {
    String	name
    String	lastName
    String	sex
    String	position
    Date	startDate
    String	degree
    String	field
    Date	dateOfBirth
    String	nationalCode
    String	mobile
    String	email
    static hasMany = [certificates:ObtainedCertificate]

    static belongsTo = [broker:Broker]
    static searchable = true

    static constraints = {
        name(nullable: false)
        lastName(nullable: false)
        sex(nullable: false,inList: ['male','female'])
        position(nullable: false,inList: ['DeputyCEO',
                                          'ClerkOfficeReceptionist',
                                          'FinanceAndAdministration Manager',
                                          'ChiefFinancialOfficer',
                                          'DirectorOfAdministration',
                                          'HeadOfAccounting',
                                          'AccountingOfficer',
                                          'PortfolioManager',
                                          'ExpertPortfolio',
                                          'FundManager',
                                          'ExpertFund',
                                          'ResearchandDevelopmentManager',
                                          'OfficerITstaff',
                                          'onlinetransactionsOfficer',
                                          'callcenterOfficer',
                                          'DirectorofSecurities',
                                          'SecuritiesDealer',
                                          'Derivativesecuritiestrader',
                                          'SecuritiesComplianceConsultant',
                                          'SecuritiesReceptionist',
                                          'SecuritiesComplianceOfficer',
                                          'securitiesAcceptanceFuture',
                                          'CommodityManager',
                                          'CommodityTrader',
                                          'CommodityDerivativesTrader',
                                          'CommodityReceptionistConsultant',
                                          'CommodityReceptionist',
                                          'CommodityComplianceOfficer',
                                          'CommodityAcceptanceFuture',
                                          'EnergyExchangeManager',
                                          'EnergyExchangeTrader',
                                          'EnergyExchangeReceptionist'])
        startDate(nullable: false)
        degree(nullable: false,inList:['PhD',
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
        nationalCode(nullable: false)
        mobile(nullable: false)
        email(nullable: false)

    }
}
