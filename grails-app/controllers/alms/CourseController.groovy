package alms

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

import java.text.SimpleDateFormat

class CourseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [courseInstanceList: Course.list(params), courseInstanceTotal: Course.count()]
    }

    def listCourse(){
        def list= Course.list()

//        TimeZone.setDefault(TimeZone.getTimeZone('GMT'))

        def courseList = new ArrayList()
        Course.list().each { course ->
            def courseMap = new HashMap()
            courseMap.put("TaskID", course.id)
            courseMap.put("Title", course.title)
//            courseMap.put("Start", course.start.time)
            courseMap.put("Start", "Date(${course.start.time})")
            courseMap.put("End", "Date(${course.end.time})")
//            courseMap.put("End", course.end.time)
            courseMap.put("StartTimezone", course.startTimezone)
            courseMap.put("EndTimezone", course.endTimezone)
            courseMap.put("Description", course.description)
            courseMap.put("RecurrenceID", course.recurrenceID)
            courseMap.put("RecurrenceRule", course.recurrenceRule)
            courseMap.put("RecurrenceException", course.recurrenceException)
            courseMap.put("OwnerID", course.ownerID)
            courseMap.put("IsAllDay", course.isAllDay)
            courseList.add(courseMap)
        }

        println(courseList as JSON)
        //todo mtb change return value
//        render(courseList as JSON)
        def jsonResponse=courseList as JSON
        def response =jsonResponse.toString().replaceAll("Date","\\\\/Date").replaceAll("\\)","\\)\\\\/")
        render(response)
//        render("[{\"TaskID\":4,\"OwnerID\":2,\"Title\":\"Bowling tournament\",\"Description\":\"\",\"StartTimezone\":null,\"Start\":\"\\/Date(1370811600000)\\/\",\"End\":\"\\/Date(1370822400000)\\/\",\"EndTimezone\":null,\"RecurrenceRule\":null,\"RecurrenceID\":null,\"RecurrenceException\":null,\"IsAllDay\":false},{\"TaskID\":5,\"OwnerID\":2,\"Title\":\"Take the dog to the vet\",\"Description\":\"\",\"StartTimezone\":null,\"Start\":\"\\/Date(1370847600000)\\/\",\"End\":\"\\/Date(1370851200000)\\/\",\"EndTimezone\":null,\"RecurrenceRule\":null,\"RecurrenceID\":null,\"RecurrenceException\":null,\"IsAllDay\":false},{\"TaskID\":6,\"OwnerID\":2,\"Title\":\"Call Charlie about the project\",\"Description\":\"\",\"StartTimezone\":null,\"Start\":\"\\/Date(1370950200000)\\/\",\"End\":\"\\/Date(1370955600000)\\/\",\"EndTimezone\":null,\"RecurrenceRule\":null,\"RecurrenceID\":null,\"RecurrenceException\":null,\"IsAllDay\":false},{\"TaskID\":7,\"OwnerID\":3,\"Title\":\"Meeting with Alex\",\"Description\":\"\",\"StartTimezone\":null,\"Start\":\"\\/Date(1371034800000)\\/\",\"End\":\"\\/Date(1371038400000)\\/\",\"EndTimezone\":null,\"RecurrenceRule\":null,\"RecurrenceID\":null,\"RecurrenceException\":null,\"IsAllDay\":false}]")
//        render("[{\"TaskID\":4,\"OwnerID\":2,\"Title\":\"Bowling tournament\",\"Description\":\"\",\"StartTimezone\":null,\"Start\":\"\\/Date(1370811600000)\\/\",\"End\":\"\\/Date(1370822400000)\\/\",\"EndTimezone\":null,\"RecurrenceRule\":null,\"RecurrenceID\":null,\"RecurrenceException\":null,\"IsAllDay\":false}]")
    }

    def create() {
        [courseInstance: new Course(params)]
    }

    def save() {
        def courseInstance = new Course(params)
        def courseData = [:]
        if (!courseInstance.save(flush: true)) {
            render(view: "create", model: [cityInstance: cityInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])
        redirect(action: "show", id: courseInstance.id)

    }

    def saveCourse() {
        println "Here is params: $params"
        println "Here is params.models: $params.models"
        def models = new org.codehaus.groovy.grails.web.json.JSONArray(params.models)
        def courseData = [:]

//        def tz=TimeZone.getDefault()
//        TimeZone.setDefault(TimeZone.getTimeZone('UTC'))

        def courseInstance = new Course()
        courseInstance.title = models[0].Title
        courseInstance.start = Date.parse("yyyy-MM-dd'T'hh:mm:ss.S'Z'", models[0].Start)
        courseInstance.end = Date.parse("yyyy-MM-dd'T'hh:mm:ss.S'Z'", models[0].End)
        courseInstance.startTimezone = models[0].StartTimezone//?models[0].StartTimezone:""
        courseInstance.endTimezone = models[0].EndTimezone//?models[0].EndTimezone:""
        courseInstance.description = models[0].Description//?models[0].Description:""
        courseInstance.recurrenceID = models[0].RecurrenceID
        courseInstance.recurrenceRule = models[0].RecurrenceRule//?models[0].RecurrenceRule:""
        courseInstance.recurrenceException = models[0].RecurrenceException//?models[0].RecurrenceException:""
        courseInstance.ownerID = models[0].OwnerID
        courseInstance.isAllDay = models[0].IsAllDay

        if (!courseInstance.save(flush: true)) {

            //todo mtb how return error message
            render(courseData as JSON)
        }


//        courseData.TaskID = courseInstance.id
//        courseData.Title = courseInstance.title
//        courseData.Start = courseInstance.start.time
//        courseData.End = courseInstance.end.time
//        courseData.StartTimezone = courseInstance.startTimezone
//        courseData.EndTimezone = courseInstance.endTimezone
//        courseData.Description = courseInstance.description
//        courseData.RecurrenceID = courseInstance.recurrenceID
//        courseData.RecurrenceRule = courseInstance.recurrenceRule
//        courseData.RecurrenceException = courseInstance.recurrenceException
//        courseData.OwnerID = courseInstance.ownerID
//        courseData.IsAllDay = courseInstance.isAllDay
//todo mtb change return value
//        def jsonResponse=[courseData] as JSON
//        def response =jsonResponse.toString().replaceAll("new Date","\"\\\\/Date").replaceAll("\\),","\\)\\\\/\",")
//        render(response)
//        return   render("[{\"TaskID\":122,\"OwnerID\":1,\"Title\":\"No title\",\"Description\":\"\",\"StartTimezone\":\"\",\"Start\":\"\\/Date(1370966400000)\\/\",\"End\":\"\\/Date(1370968200000)\\/\",\"EndTimezone\":\"\",\"RecurrenceRule\":\"\",\"RecurrenceID\":null,\"RecurrenceException\":\"\",\"IsAllDay\":false}]")
//

        def recurrenceID= courseInstance.recurrenceID?"\""+courseInstance.recurrenceID+"\"":null
        render("[{\"TaskID\":${courseInstance.id}," +
                "\"OwnerID\":${courseInstance.ownerID}," +
                "\"Title\":\"${courseInstance.title}\"," +
                "\"Description\":\"${courseInstance.description}\"," +
                "\"StartTimezone\":\"${courseInstance.startTimezone}\"," +
                "\"Start\":\"\\/Date(${courseInstance.start.time})\\/\"," +
                "\"End\":\"\\/Date(${courseInstance.end.time})\\/\"," +
                "\"EndTimezone\":\"${courseInstance.endTimezone}\"," +
                "\"RecurrenceRule\":\"${courseInstance.recurrenceRule}\"," +
                "\"RecurrenceID\":${recurrenceID}," +
                "\"RecurrenceException\":\"${courseInstance.recurrenceException}\"," +
                "\"IsAllDay\":${courseInstance.isAllDay}}]")
    }

    def show(Long id) {
        def courseInstance = Course.get(id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
            return
        }

        [courseInstance: courseInstance]
    }

    def edit(Long id) {
        def courseInstance = Course.get(id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
            return
        }

        [courseInstance: courseInstance]
    }

    def update(Long id, Long version) {
        def courseInstance = Course.get(id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (courseInstance.version > version) {
                courseInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'course.label', default: 'Course')] as Object[],
                        "Another user has updated this Course while you were editing")
                render(view: "edit", model: [courseInstance: courseInstance])
                return
            }
        }

        courseInstance.properties = params

        if (!courseInstance.save(flush: true)) {
            render(view: "edit", model: [courseInstance: courseInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])
        redirect(action: "show", id: courseInstance.id)
    }

    def updateCourse() {
        println "update params: $params"
        println "Update params.models: $params.models"
        def models = new org.codehaus.groovy.grails.web.json.JSONArray(params.models)
        def courseData = [:]

        def courseInstance = Course.get(models[0].TaskID)
        courseInstance.title = models[0].Title
        courseInstance.start = Date.parse("yyyy-MM-dd'T'hh:mm:ss.S'Z'", models[0].Start)
        courseInstance.end = Date.parse("yyyy-MM-dd'T'hh:mm:ss.S'Z'", models[0].End)
        courseInstance.startTimezone = models[0].StartTimezone//?models[0].StartTimezone:""
        courseInstance.endTimezone = models[0].EndTimezone//?models[0].EndTimezone:""
        courseInstance.description = models[0].Description//?models[0].Description:""
        courseInstance.recurrenceID = models[0].RecurrenceID
        courseInstance.recurrenceRule = models[0].RecurrenceRule//?models[0].RecurrenceRule:""
        courseInstance.recurrenceException = models[0].RecurrenceException//?models[0].RecurrenceException:""
        courseInstance.ownerID = models[0].OwnerID
        courseInstance.isAllDay = models[0].IsAllDay

        if (!courseInstance.save(flush: true)) {

            //todo mtb how return error message
            render(courseData as JSON)
        }
        def recurrenceID= courseInstance.recurrenceID?"\""+courseInstance.recurrenceID+"\"":null
        render("[{\"TaskID\":${courseInstance.id}," +
                "\"OwnerID\":${courseInstance.ownerID}," +
                "\"Title\":\"${courseInstance.title}\"," +
                "\"Description\":\"${courseInstance.description}\"," +
                "\"StartTimezone\":\"${courseInstance.startTimezone}\"," +
                "\"Start\":\"\\/Date(${courseInstance.start.time})\\/\"," +
                "\"End\":\"\\/Date(${courseInstance.end.time})\\/\"," +
                "\"EndTimezone\":\"${courseInstance.endTimezone}\"," +
                "\"RecurrenceRule\":\"${courseInstance.recurrenceRule}\"," +
                "\"RecurrenceID\":${recurrenceID}," +
                "\"RecurrenceException\":\"${courseInstance.recurrenceException}\"," +
                "\"IsAllDay\":${courseInstance.isAllDay}}]")

//        render("[{\"TaskID\":122,\"OwnerID\":1,\"Title\":\"No title\",\"Description\":\"\",\"StartTimezone\":\"\",\"Start\":\"\\/Date(1370853000000)\\/\",\"End\":\"\\/Date(1370854800000)\\/\",\"EndTimezone\":\"\",\"RecurrenceRule\":\"\",\"RecurrenceID\":null,\"RecurrenceException\":\"\",\"IsAllDay\":false}]")
    }


    def delete(Long id) {
        def courseInstance = Course.get(id)
        if (!courseInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
            return
        }

        try {
            courseInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'course.label', default: 'Course'), id])
            redirect(action: "show", id: id)
        }
    }

    def deleteCourse(){
        //todo mtb delete response has events whole properties,if app deletes this event why sends back data?
        println "Delete params: $params"
        println "Delete params.models: $params.models"
        def models = new org.codehaus.groovy.grails.web.json.JSONArray(params.models)

        def courseInstance = Course.get(models[0].TaskID)

        try {
            courseInstance.delete(flush: true)
            def recurrenceID= courseInstance.recurrenceID?"\""+courseInstance.recurrenceID+"\"":null
            render("[{\"TaskID\":${courseInstance.id}," +
                    "\"OwnerID\":${courseInstance.ownerID}," +
                    "\"Title\":\"${courseInstance.title}\"," +
                    "\"Description\":\"${courseInstance.description}\"," +
                    "\"StartTimezone\":\"${courseInstance.startTimezone}\"," +
                    "\"Start\":\"\\/Date(${courseInstance.start.time})\\/\"," +
                    "\"End\":\"\\/Date(${courseInstance.end.time})\\/\"," +
                    "\"EndTimezone\":\"${courseInstance.endTimezone}\"," +
                    "\"RecurrenceRule\":\"${courseInstance.recurrenceRule}\"," +
                    "\"RecurrenceID\":${recurrenceID}," +
                    "\"RecurrenceException\":\"${courseInstance.recurrenceException}\"," +
                    "\"IsAllDay\":${courseInstance.isAllDay}}]")
        }
        catch (DataIntegrityViolationException e) {
            render([])
        }

    }
}
