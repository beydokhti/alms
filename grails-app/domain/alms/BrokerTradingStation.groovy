package alms

class BrokerTradingStation {
    City	city
    String	stationType
    String	activities
    String	trader
    String	phone
    //todo mtb change to Class Address
    String	address

    Broker  broker

    static belongsTo = [broker:Broker]

    static searchable = true

    static constraints = {
        city(nullable: false)
        stationType(nullable: false,inList: ['SecuritiesAndBonds',
                                             'Commodity',
                                             'Future',
                                             'Energy'
        ])
        activities(nullable: false)
        trader(nullable: false)
        phone(nullable: true)
        address(nullable: true)

    }
}
