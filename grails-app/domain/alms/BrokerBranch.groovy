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

    static belongsTo = [broker:Broker]

    static hasMany = [phones: String]

    static searchable = true


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
        //todo mtb address nullable false
        address(nullable: true)
    }
}
//todo mtb blank constraint