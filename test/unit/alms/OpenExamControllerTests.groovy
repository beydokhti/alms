package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(OpenExamController)
@Mock(OpenExam)
class OpenExamControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/openExam/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.openExamInstanceList.size() == 0
        assert model.openExamInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.openExamInstance != null
    }

    void testSave() {
        controller.save()

        assert model.openExamInstance != null
        assert view == '/openExam/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/openExam/show/1'
        assert controller.flash.message != null
        assert OpenExam.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/openExam/list'

        populateValidParams(params)
        def openExam = new OpenExam(params)

        assert openExam.save() != null

        params.id = openExam.id

        def model = controller.show()

        assert model.openExamInstance == openExam
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/openExam/list'

        populateValidParams(params)
        def openExam = new OpenExam(params)

        assert openExam.save() != null

        params.id = openExam.id

        def model = controller.edit()

        assert model.openExamInstance == openExam
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/openExam/list'

        response.reset()

        populateValidParams(params)
        def openExam = new OpenExam(params)

        assert openExam.save() != null

        // test invalid parameters in update
        params.id = openExam.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/openExam/edit"
        assert model.openExamInstance != null

        openExam.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/openExam/show/$openExam.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        openExam.clearErrors()

        populateValidParams(params)
        params.id = openExam.id
        params.version = -1
        controller.update()

        assert view == "/openExam/edit"
        assert model.openExamInstance != null
        assert model.openExamInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/openExam/list'

        response.reset()

        populateValidParams(params)
        def openExam = new OpenExam(params)

        assert openExam.save() != null
        assert OpenExam.count() == 1

        params.id = openExam.id

        controller.delete()

        assert OpenExam.count() == 0
        assert OpenExam.get(openExam.id) == null
        assert response.redirectedUrl == '/openExam/list'
    }
}
