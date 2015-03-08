package alms

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

import java.text.SimpleDateFormat

class EventController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [eventInstanceList: Event.list(params), eventInstanceTotal: Event.count()]
    }

    def listEvent() {
        def list = Event.list()

//        TimeZone.setDefault(TimeZone.getTimeZone('GMT'))

        def eventList = new ArrayList()
        Event.list().each { event ->
            def eventMap = new HashMap()
            eventMap.put("TaskID", event.id)
            eventMap.put("Title", event.title)
//            eventMap.put("Start", event.start.time)
            eventMap.put("Start", "Date(${event.start.time})")
            eventMap.put("End", "Date(${event.end.time})")
//            eventMap.put("End", event.end.time)
            eventMap.put("StartTimezone", event.startTimezone)
            eventMap.put("EndTimezone", event.endTimezone)
            eventMap.put("Description", event.description)
            eventMap.put("Price", event.price)
            eventMap.put("RecurrenceID", event.recurrenceID)
            eventMap.put("RecurrenceRule", event.recurrenceRule)
            eventMap.put("RecurrenceException", event.recurrenceException)
            eventMap.put("CourseID", event.course.id)
            eventMap.put("IsAllDay", event.isAllDay)
            eventList.add(eventMap)
        }

        println(eventList as JSON)
        //todo mtb change return value
//        render(eventList as JSON)
        def jsonResponse = eventList as JSON
        def response = jsonResponse.toString().replaceAll("Date", "\\\\/Date").replaceAll("\\)", "\\)\\\\/")
        render(response)
//        render("[{\"TaskID\":4,\"OwnerID\":2,\"Title\":\"Bowling tournament\",\"Description\":\"\",\"StartTimezone\":null,\"Start\":\"\\/Date(1370811600000)\\/\",\"End\":\"\\/Date(1370822400000)\\/\",\"EndTimezone\":null,\"RecurrenceRule\":null,\"RecurrenceID\":null,\"RecurrenceException\":null,\"IsAllDay\":false},{\"TaskID\":5,\"OwnerID\":2,\"Title\":\"Take the dog to the vet\",\"Description\":\"\",\"StartTimezone\":null,\"Start\":\"\\/Date(1370847600000)\\/\",\"End\":\"\\/Date(1370851200000)\\/\",\"EndTimezone\":null,\"RecurrenceRule\":null,\"RecurrenceID\":null,\"RecurrenceException\":null,\"IsAllDay\":false},{\"TaskID\":6,\"OwnerID\":2,\"Title\":\"Call Charlie about the project\",\"Description\":\"\",\"StartTimezone\":null,\"Start\":\"\\/Date(1370950200000)\\/\",\"End\":\"\\/Date(1370955600000)\\/\",\"EndTimezone\":null,\"RecurrenceRule\":null,\"RecurrenceID\":null,\"RecurrenceException\":null,\"IsAllDay\":false},{\"TaskID\":7,\"OwnerID\":3,\"Title\":\"Meeting with Alex\",\"Description\":\"\",\"StartTimezone\":null,\"Start\":\"\\/Date(1371034800000)\\/\",\"End\":\"\\/Date(1371038400000)\\/\",\"EndTimezone\":null,\"RecurrenceRule\":null,\"RecurrenceID\":null,\"RecurrenceException\":null,\"IsAllDay\":false}]")
//        render("[{\"TaskID\":4,\"OwnerID\":2,\"Title\":\"Bowling tournament\",\"Description\":\"\",\"StartTimezone\":null,\"Start\":\"\\/Date(1370811600000)\\/\",\"End\":\"\\/Date(1370822400000)\\/\",\"EndTimezone\":null,\"RecurrenceRule\":null,\"RecurrenceID\":null,\"RecurrenceException\":null,\"IsAllDay\":false}]")
    }

    def create() {
        [eventInstance: new Event(params)]
    }

    def save() {
        def eventInstance = new Event(params)
        def eventData = [:]
        if (!eventInstance.save(flush: true)) {
            render(view: "create", model: [cityInstance: cityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])
        redirect(action: "show", id: eventInstance.id)

    }

    def saveEvent() {
        println "Here is params: $params"
        println "Here is params.models: $params.models"
        def models = new org.codehaus.groovy.grails.web.json.JSONArray(params.models)

        def courseInstance = Course.get(models[0].CourseID)

        if (courseInstance) {
            def eventInstance = new Event()
            eventInstance.title = models[0].Title
            eventInstance.start = Date.parse("yyyy-MM-dd'T'hh:mm:ss.S'Z'", models[0].Start)
            eventInstance.end = Date.parse("yyyy-MM-dd'T'hh:mm:ss.S'Z'", models[0].End)
            eventInstance.startTimezone = models[0].StartTimezone//?models[0].StartTimezone:""
            eventInstance.endTimezone = models[0].EndTimezone//?models[0].EndTimezone:""
            eventInstance.description = models[0].Description//?models[0].Description:""
            eventInstance.price = models[0].Price//?models[0].Description:""
            eventInstance.recurrenceID = models[0].RecurrenceID
            eventInstance.recurrenceRule = models[0].RecurrenceRule//?models[0].RecurrenceRule:""
            eventInstance.recurrenceException = models[0].RecurrenceException//?models[0].RecurrenceException:""
            eventInstance.price = models[0].Price
            eventInstance.isAllDay = models[0].IsAllDay

            courseInstance.addToEvents(eventInstance)
            if (!eventInstance.save(flush: true)) {

                //todo mtb how return error message
                render([])
            }

            def recurrenceID = eventInstance.recurrenceID ? "\"" + eventInstance.recurrenceID + "\"" : null
            render("[{\"TaskID\":${eventInstance.id}," +
                    "\"CourseID\":${eventInstance.course.id}," +
                    "\"Title\":\"${eventInstance.title}\"," +
                    "\"Description\":\"${eventInstance.description}\"," +
                    "\"Price\":\"${eventInstance.price}\"," +
                    "\"StartTimezone\":\"${eventInstance.startTimezone}\"," +
                    "\"Start\":\"\\/Date(${eventInstance.start.time})\\/\"," +
                    "\"End\":\"\\/Date(${eventInstance.end.time})\\/\"," +
                    "\"EndTimezone\":\"${eventInstance.endTimezone}\"," +
                    "\"RecurrenceRule\":\"${eventInstance.recurrenceRule}\"," +
                    "\"RecurrenceID\":${recurrenceID}," +
                    "\"RecurrenceException\":\"${eventInstance.recurrenceException}\"," +
                    "\"IsAllDay\":${eventInstance.isAllDay}}]")
        }

    }

    def show(Long id) {
        def eventInstance = Event.get(id)
        if (!eventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), id])
            redirect(action: "list")
            return
        }

        [eventInstance: eventInstance]
    }

    def edit(Long id) {
        def eventInstance = Event.get(id)
        if (!eventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), id])
            redirect(action: "list")
            return
        }

        [eventInstance: eventInstance]
    }

    def update(Long id, Long version) {
        def eventInstance = Event.get(id)
        if (!eventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (eventInstance.version > version) {
                eventInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'event.label', default: 'Event')] as Object[],
                        "Another user has updated this Event while you were editing")
                render(view: "edit", model: [eventInstance: eventInstance])
                return
            }
        }

        eventInstance.properties = params

        if (!eventInstance.save(flush: true)) {
            render(view: "edit", model: [eventInstance: eventInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])
        redirect(action: "show", id: eventInstance.id)
    }

    def updateEvent() {
        println "update params: $params"
        println "Update params.models: $params.models"
        def models = new org.codehaus.groovy.grails.web.json.JSONArray(params.models)
        def eventData = [:]

        def courseInstance = Course.get(models[0].CourseID)

        if (courseInstance) {
            def eventInstance = Event.get(models[0].TaskID)
            eventInstance.title = models[0].Title
            eventInstance.start = Date.parse("yyyy-MM-dd'T'hh:mm:ss.S'Z'", models[0].Start)
            eventInstance.end = Date.parse("yyyy-MM-dd'T'hh:mm:ss.S'Z'", models[0].End)
            eventInstance.startTimezone = models[0].StartTimezone//?models[0].StartTimezone:""
            eventInstance.endTimezone = models[0].EndTimezone//?models[0].EndTimezone:""
            eventInstance.description = models[0].Description//?models[0].Description:""
            eventInstance.price = models[0].Price//?models[0].Description:""
            eventInstance.recurrenceID = models[0].RecurrenceID
            eventInstance.recurrenceRule = models[0].RecurrenceRule//?models[0].RecurrenceRule:""
            eventInstance.recurrenceException = models[0].RecurrenceException//?models[0].RecurrenceException:""
            eventInstance.isAllDay = models[0].IsAllDay

            if (!eventInstance.save(flush: true)) {

                //todo mtb how return error message
                render(eventData as JSON)
            }
            def recurrenceID = eventInstance.recurrenceID ? "\"" + eventInstance.recurrenceID + "\"" : null
            render("[{\"TaskID\":${eventInstance.id}," +
                    "\"CourseID\":${eventInstance.course.id}," +
                    "\"Title\":\"${eventInstance.title}\"," +
                    "\"Description\":\"${eventInstance.description}\"," +
                    "\"Price\":\"${eventInstance.price}\"," +
                    "\"StartTimezone\":\"${eventInstance.startTimezone}\"," +
                    "\"Start\":\"\\/Date(${eventInstance.start.time})\\/\"," +
                    "\"End\":\"\\/Date(${eventInstance.end.time})\\/\"," +
                    "\"EndTimezone\":\"${eventInstance.endTimezone}\"," +
                    "\"RecurrenceRule\":\"${eventInstance.recurrenceRule}\"," +
                    "\"RecurrenceID\":${recurrenceID}," +
                    "\"RecurrenceException\":\"${eventInstance.recurrenceException}\"," +
                    "\"IsAllDay\":${eventInstance.isAllDay}}]")

//        render("[{\"TaskID\":122,\"OwnerID\":1,\"Title\":\"No title\",\"Description\":\"\",\"StartTimezone\":\"\",\"Start\":\"\\/Date(1370853000000)\\/\",\"End\":\"\\/Date(1370854800000)\\/\",\"EndTimezone\":\"\",\"RecurrenceRule\":\"\",\"RecurrenceID\":null,\"RecurrenceException\":\"\",\"IsAllDay\":false}]")
        }
    }


    def delete(Long id) {
        def eventInstance = Event.get(id)
        if (!eventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), id])
            redirect(action: "list")
            return
        }

        try {
            eventInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'event.label', default: 'Event'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'event.label', default: 'Event'), id])
            redirect(action: "show", id: id)
        }
    }

    def deleteEvent() {
        //todo mtb delete response has events whole properties,if app deletes this event why sends back data?
        println "Delete params: $params"
        println "Delete params.models: $params.models"
        def models = new org.codehaus.groovy.grails.web.json.JSONArray(params.models)

        def eventInstance = Event.get(models[0].TaskID)

        try {
            def recurrenceID = eventInstance.recurrenceID ? "\"" + eventInstance.recurrenceID + "\"" : null
            def response = "[{\"TaskID\":${eventInstance.id}," +
                    "\"CourseID\":${eventInstance.course.id}," +
                    "\"Title\":\"${eventInstance.title}\"," +
                    "\"Description\":\"${eventInstance.description}\"," +
                    "\"Price\":\"${eventInstance.price}\"," +
                    "\"StartTimezone\":\"${eventInstance.startTimezone}\"," +
                    "\"Start\":\"\\/Date(${eventInstance.start.time})\\/\"," +
                    "\"End\":\"\\/Date(${eventInstance.end.time})\\/\"," +
                    "\"EndTimezone\":\"${eventInstance.endTimezone}\"," +
                    "\"RecurrenceRule\":\"${eventInstance.recurrenceRule}\"," +
                    "\"RecurrenceID\":${recurrenceID}," +
                    "\"RecurrenceException\":\"${eventInstance.recurrenceException}\"," +
                    "\"IsAllDay\":${eventInstance.isAllDay}}]"
            eventInstance.delete()

            render(response)
        }
        catch (DataIntegrityViolationException e) {
            println(e.toString())
            render([])
        }

    }
}
