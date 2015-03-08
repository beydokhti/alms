package alms

class ObtainedCertificate {
    Certificate certificate
    Date        obtainedDate
    Person      person

    static belongsTo = [person:Person]

    static searchable = true

    static constraints = {
        certificate(nullable: false)
        obtainedDate(nullable: false)
    }
}
