package alms

class BrokerLicense implements Comparable {
    Byte    displayOrder
    String  title1
    String  title2
    Boolean hasLicense
    String  licenseNumber
    Date    licenseDate
    Date    licenseExpiry

    static belongsTo = [broker:Broker]

    static searchable = true

    static constraints = {
        displayOrder(nullable: false, unique: true)
        title1(nullable: true)
        title2(nullable: false, unique: ['title1'])
        hasLicense(nullable: true)
        licenseNumber(nullable: true)
        licenseDate(nullable: true)
        licenseExpiry(nullable: true)
    }

    @Override
    int compareTo(Object o) {
        if (o instanceof BrokerLicense)
            return this.displayOrder <=> o.displayOrder
        else
            return -1
    }
}
