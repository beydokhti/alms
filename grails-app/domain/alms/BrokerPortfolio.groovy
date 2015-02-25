package alms

class BrokerPortfolio {

    Long	countOfContract
    Long	sumOfContract
    Long	countOfConsultantContract

    static belongsTo = [broker:Broker]

    static searchable = true

    static constraints = {
        countOfContract(nullable: false)
        sumOfContract(nullable: false)
        countOfConsultantContract(nullable: false)
    }
}
