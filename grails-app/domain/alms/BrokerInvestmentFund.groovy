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
        fundManager(nullable: false)
        fundCustodian(nullable: false)
        agencyFund(nullable: false)
        fundRegisterManager(nullable: false)
        liquidityGuaranteeFund(nullable: false)
//todo mtb nullable false
        investmentManager(nullable: true)

    }
}
