package alms

class PersonGroup {
    String  groupTitle

    static constraints = {
        groupTitle(nullable: false,blank: false,inList: ["independent","brokerMember","institutionMember"])
    }
}
