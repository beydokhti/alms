package alms

class RegisteredEvent {
    Person  person
    Event   event
    short   mark

    static belongsTo = [person:Person,event:Event]

    static constraints = {
    }
}
