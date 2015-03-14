package alms

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

class CourseController {

    def queryService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
    }

    def jsonList() {
        def columns = ['action', 'title', 'color', 'colorPreview']

        def dataTableResponse = [:]
        dataTableResponse.iTotalRecords = Course.count()
        dataTableResponse.iTotalDisplayRecords = dataTableResponse.iTotalRecords

        def list

        if (params.containsKey('sSearch') && params.get('sSearch')) {
            def options = [:]
            options.max = Math.min(params.iDisplayLength ? params.int('iDisplayLength') : 10, 100)
            options.offset = params.int("iDisplayStart")
            def sortIndex = params.int("iSortCol_0")
            if (sortIndex > 0) {
                options.order = params["sSortDir_0"]
                options.sort = columns[sortIndex]
            }
            def result = Course.search("*${params.sSearch}*", options)
            list = result.results
        } else {
            def query = queryService.listQuery(params + [columns: columns])
            list = Course.createCriteria().list(query)
        }

        def array = list.collect { Course it ->
            def action = "<a href='${g.createLink(action: "edit", params: [id: it.id])}'>${message(code: "edit", default: "Edit")}</a>" +
                    "<a href='${g.createLink(controller: "scheduler", action: "scheduler", id: it.id)}'>${message(code: "Scheduler", default: "Sch")}</a>"
            def colorPreview = "<div style=\"color:$it.color\">${message(code: "color." + it.color, default: it.color)}</div>"
            println("course-json:action:$action")
            println("course-json:action:$colorPreview")
            [action, it.title, colorPreview]
        }

        dataTableResponse.aaData = array
        render(dataTableResponse as JSON)
    }


    def create() {
        [courseInstance: new Course(params)]
    }

    def save() {
        def courseInstance = new Course(params)
        if (!courseInstance.save(flush: true)) {
            render(view: "create", model: [courseInstance: courseInstance])
            return
        }

        def certificateInstance = new Certificate()
        certificateInstance.cerTitle = courseInstance.title
        certificateInstance.cerType = "kanoon"
        certificateInstance.save()

        flash.message = message(code: 'default.created.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])
        redirect(action: "list")
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
                render(view: "edit", model: [id: courseInstance.id])
                return
            }
        }

        courseInstance.properties = params

        if (!courseInstance.save(flush: true)) {
            render(view: "edit", model: [id: courseInstance.id])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'course.label', default: 'Course'), courseInstance.id])
        redirect(action: "list")
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
}
