package alms

class RegisteredTerm {

    Person  person
    Term   term

    static belongsTo = [person:Person,term:Term]

    static constraints = {
    }
}

