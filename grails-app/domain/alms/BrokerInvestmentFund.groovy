package alms

class BrokerInvestmentFund {

    String	fundName
    String	startingDate
    String	typeAndScale
    String	fundManager
    String	fundCustodian
    String	agencyFund
    String	fundRegisterManager
    String	liquidityGuaranteeFund
    String	investmentManager

    static belongsTo = [broker:Broker]

    static searchable = true


    static constraints = {
        fundName(nullable: false)
        startingDate(nullable: false)
        typeAndScale(nullable: false)
        fundManager(nullable: false)
        fundCustodian(nullable: false)
        agencyFund(nullable: false)
        fundRegisterManager(nullable: false)
        liquidityGuaranteeFund(nullable: false)
        investmentManager(nullable: false)

    }
}
