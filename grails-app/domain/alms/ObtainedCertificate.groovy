package alms

class ObtainedCertificate {
    Certificate certificate
    Date obtainedDate
    static constraints = {
        certificate(nullable: false)
        obtainedDate(nullable: false)
    }
}
