package alms

class BrokerMember {
    Person person
    Broker  broker
    Date	startDate
    Date	endDate
    Boolean isActive
    String	position

    static hasMany = [certificates:ObtainedCertificate]

    static belongsTo = [broker:Broker,person:Person]

    static searchable = true

    static constraints = {
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
        endDate(nullable: true)
        isActive(nullable: false,default:true)


    }
}
//todo mtb hasmany