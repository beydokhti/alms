package alms

import grails.converters.JSON

class SchedulerController {

    def index() {}

    def scheduler() {
        println("scheduler-scheduler:$params")

        def termId = params.id

        def courseDataSource = new ArrayList()
        def courseFilter = new ArrayList()
        def courseList
        def dataSource = ""
        def filter
        def startDate
        def startTime

        if (!termId) {
            Course.list().each { course ->
                def courseMap = new HashMap()
                courseMap.put("text", course.title)
                courseMap.put("value", course.id)
                courseMap.put("color", course.color)
                courseDataSource.add(courseMap)

                def filterMap = new HashMap()
                filterMap.put("field", "courseId")
                filterMap.put("operator", "eq")
                filterMap.put("value", course.id)
                courseFilter.add(filterMap)
            }
            dataSource = courseDataSource as JSON
            filter = courseFilter as JSON
            courseList = Course.list()
            startDate = new Date().format("yyyy/MM/dd").toString()
            startTime = new Date().format("yyyy/MM/dd").toString() + " 07:00 AM"
        } else {

            def termInstance = Term.get(termId)
            termInstance.curriculum.courses.each { course ->
                def courseMap = new HashMap()
                courseMap.put("text", course.title)
                courseMap.put("value", course.id)
                courseMap.put("color", course.color)
                courseDataSource.add(courseMap)

                def filterMap = new HashMap()
                filterMap.put("field", "courseId")
                filterMap.put("operator", "eq")
                filterMap.put("value", course.id)
                courseFilter.add(filterMap)
            }
            dataSource = courseDataSource as JSON
            filter = courseFilter as JSON
            courseList = termInstance.curriculum.courses
            startDate =  termInstance.startDate.format("yyyy/MM/dd").toString()
            startTime=termInstance.startDate.format("yyyy/MM/dd").toString()+ " 07:00 AM"
        }

        [courseDataSource: dataSource.toString(), courseList: courseList, filter: filter.toString(),startDate:startDate,startTime:startTime,termId:termId]
    }

    def scheduler2() {
        def courseDataSource = new ArrayList()
        Course.list().each { course ->
            def courseMap = new HashMap()
            courseMap.put("text", course.title)
            courseMap.put("value", course.id)
            courseMap.put("color", course.color)
            courseDataSource.add(courseMap)
        }
        def response = courseDataSource as JSON
        [courseDataSource: response.toString()]
    }
}
