package alms

import grails.converters.JSON

class SchedulerController {

    def index() {}

    def scheduler() {
        println("scheduler-scheduler:$params")

        def courseId = params.id
        def courseDataSource = new ArrayList()
        def courseFilter = new ArrayList()
        def courseList
        def dataSource
        def filter

        if (!courseId) {
            Course.list().each { course ->
                def courseMap = new HashMap()
                courseMap.put("text", course.title)
                courseMap.put("value", course.id)
                courseMap.put("color", course.color)
                courseDataSource.add(courseMap)

                def filterMap = new HashMap()
                filterMap.put("field","courseId")
                filterMap.put("operator","eq")
                filterMap.put("value",course.id)
                courseFilter.add(filterMap)
            }
            dataSource = courseDataSource as JSON
            filter=courseFilter as JSON
            courseList = Course.list()
        } else {
            def courseInstance =Course.get(courseId)
            def courseMap = new HashMap()
            courseMap.put("text", courseInstance.title)
            courseMap.put("value", courseInstance.id)
            courseMap.put("color", courseInstance.color)

            def filterMap = new HashMap()
            filterMap.put("field","courseId")
            filterMap.put("operator","eq")
            filterMap.put("value",courseInstance.id)
            courseFilter.add(filterMap)

            dataSource=[courseMap as JSON]
            courseList =Course.get(courseId)
            filter=courseFilter as JSON
        }

        [courseDataSource: dataSource.toString(), courseList: courseList,filter:filter.toString()]
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
