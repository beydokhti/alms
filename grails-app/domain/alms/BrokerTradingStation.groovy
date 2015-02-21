package alms

class BrokerTradingStation {
    String	city
    String	stationType
    String	activities
    String	trader
    String	phone
    String	address

    static constraints = {
        city(nullable: false)
        stationType(nullable: false,inList: ['SecuritiesAndBonds',
                                             'Commodity',
                                             'Future',
                                             'Energy'
        ])
        activities(nullable: false)
        trader(nullable: false)
        phone(nullable: false)
        address(nullable: false)

    }
}
