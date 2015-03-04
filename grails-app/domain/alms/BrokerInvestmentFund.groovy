package alms

class BrokerInvestmentFund {

    String	fundName
    Date	startingDate
    String	typeAndScale
    boolean fundManager
    boolean	fundCustodian
    boolean	agencyFund
    boolean	fundRegisterManager
    boolean	liquidityGuaranteeFund

    Broker  broker

    static hasMany = [investmentManager : String]

    static belongsTo = [broker:Broker]

    static searchable = true


    static constraints = {
        fundName(nullable: false)
        startingDate(nullable: false)
        typeAndScale(nullable: false,inList: ["FIStocksLarge",
                                              "FIStocksSmall",
                                              "FIStocksPayoutLarge",
                                              "FIStocksPayoutSmall",
                                              "IFForeigners",
                                              "IFIndex",
                                              "ETF",
                                              "FIGuaranteedInterest",
                                              "FIProfitForecasts",
                                              "FIForeign",
                                              "IFCharity",
                                              "IFIndexLarge",
                                              "IFLandBuilding"])
        fundManager(nullable:true)
        fundCustodian(nullable: true)
        agencyFund(nullable: true)
        fundRegisterManager(nullable: true)
        liquidityGuaranteeFund(nullable: true)
//todo mtb nullable false
        investmentManager(nullable: true)

    }
}
