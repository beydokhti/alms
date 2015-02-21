package alms

class BrokerShareholder {
    String shareholderName
    String ownershipType
    Byte ownershipPercent
    Long sharesCount
    String representativeOnBoard
    String description

    static constraints = {
        shareholderName(nullable: false)
        ownershipType(nullable: false,inList: ['individual','legal'])
        ownershipPercent(nullable: false)
        sharesCount(nullable: false)
        representativeOnBoard(nullable: false)
        description(nullable: true, maxSize: 1024)
    }
}
