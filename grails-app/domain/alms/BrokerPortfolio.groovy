package alms

class BrokerPortfolio {

    Long	countOfContract
    Long	sumOfContract
    Long	countOfConsultantContract
    Broker  broker

    static belongsTo = [broker:Broker]

    static searchable = true

    static constraints = {
        countOfContract(nullable: false)
        sumOfContract(nullable: false)
        countOfConsultantContract(nullable: false)
    }
}
