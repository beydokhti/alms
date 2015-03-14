package alms

class Certificate {
    String	cerType
    String	cerTitle


    static constraints = {
        cerType(nullable: false,inList: ["stock","relStock","relBusiness","kanoon"])
        cerTitle(nullable: false)
    }

    String toString(){
        "$cerTitle"
    }
}
