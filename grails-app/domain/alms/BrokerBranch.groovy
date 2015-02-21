package alms

class BrokerBranch {
    City City
    String branchType
    String representativePerson
    Short personnelCount

    Boolean tseStock
    Boolean imeStock
    Boolean energyStock
    Boolean imeFuture
    Boolean tseFuture
    Boolean mutualFundAdmin

    Address address

    static hasMany = [phones: String]

    static constraints = {
        city(nullable: false)
        branchType(nullable: false, inList: ['Branch','AdmissionsOffice','Representation'])
        representativePerson(nullable: false)
        personnelCount(nullable: false)
        tseStock(nullable: false)
        imeStock(nullable: false)
        energyStock(nullable: false)
        imeFuture(nullable: false)
        tseFuture(nullable: false)
        mutualFundAdmin(nullable: false)
        address(nullable: false)
    }
}
