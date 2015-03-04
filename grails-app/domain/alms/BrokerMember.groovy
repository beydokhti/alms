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
    Broker  broker

    static hasMany = [certificates:ObtainedCertificate]

    static belongsTo = [broker:Broker]
    static searchable = true

    static constraints = {
        name(nullable: false)
        lastName(nullable: false)
        sex(nullable: false,inList: ['male','female'])
        position(nullable: false,inList: ['DeputyCEO',
                                          'Receptionist',
                                          'FinanceMng',
                                          'FinancialOff',
                                          'Administration',
                                          'Accounting',
                                          'AccountingOff',
                                          'PortfolioMng',
                                          'ExpertPort',
                                          'FundMng',
                                          'ExpertFund',
                                          'ResearchMng',
                                          'ITStaff',
                                          'OnTxnOff',
                                          'CallCenterOff',
                                          'Securities',
                                          'SecDealer',
                                          'DerivativeSec',
                                          'SecComplianceCon',
                                          'SecReceptionist',
                                          'SecCompliance',
                                          'secAcceptance',
                                          'CommodityMng',
                                          'ComTrader',
                                          'ComDerivatives',
                                          'ComRecConsultant',
                                          'ComReceptionist',
                                          'ComComplianceOff',
                                          'ComAcceptanceFuture',
                                          'EnergyExMng',
                                          'EnergyExTrader',
                                          'EnergyExRec'])
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
        mobile(nullable: true)
        email(nullable: true)

    }
}
//todo mtb hasmany