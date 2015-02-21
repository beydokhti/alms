package alms

class Certificate {
    def messageSource
    String	cerType
    String	cerTitle


    static constraints = {
        cerType(nullable: false)
        cerTitle(nullable: false)
    }

    String toString(){
        "$cerType,$cerTitle"

    }
}
