package alms

class BrokerPortfolio {

    String	countOfContract
    Long	sumOfContract
    Long	countOfConsultantContract

    static constraints = {
        countOfContract(nullable: false)
        sumOfContract(nullable: false)
        countOfConsultantContract(nullable: false)
    }
}
