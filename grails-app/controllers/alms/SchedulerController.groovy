package alms

import grails.converters.JSON

class SchedulerController {

    def index() {}
    def scheduler() {
        def courseDataSource=new ArrayList()
        Course.list().each {course->
            def courseMap=new HashMap()
            courseMap.put("text",course.title)
            courseMap.put("value",course.id)
            courseMap.put("color",course.color)
            courseDataSource.add(courseMap)
        }
        def response=courseDataSource as JSON
        [courseDataSource :response.toString() ]
    }
}
