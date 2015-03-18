package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(RegisteredOpenExamController)
@Mock(RegisteredOpenExam)
class RegisteredOpenExamControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/registeredOpenExam/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.registeredOpenExamInstanceList.size() == 0
        assert model.registeredOpenExamInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.registeredOpenExamInstance != null
    }

    void testSave() {
        controller.save()

        assert model.registeredOpenExamInstance != null
        assert view == '/registeredOpenExam/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/registeredOpenExam/show/1'
        assert controller.flash.message != null
        assert RegisteredOpenExam.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/registeredOpenExam/list'

        populateValidParams(params)
        def registeredOpenExam = new RegisteredOpenExam(params)

        assert registeredOpenExam.save() != null

        params.id = registeredOpenExam.id

        def model = controller.show()

        assert model.registeredOpenExamInstance == registeredOpenExam
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/registeredOpenExam/list'

        populateValidParams(params)
        def registeredOpenExam = new RegisteredOpenExam(params)

        assert registeredOpenExam.save() != null

        params.id = registeredOpenExam.id

        def model = controller.edit()

        assert model.registeredOpenExamInstance == registeredOpenExam
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/registeredOpenExam/list'

        response.reset()

        populateValidParams(params)
        def registeredOpenExam = new RegisteredOpenExam(params)

        assert registeredOpenExam.save() != null

        // test invalid parameters in update
        params.id = registeredOpenExam.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/registeredOpenExam/edit"
        assert model.registeredOpenExamInstance != null

        registeredOpenExam.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/registeredOpenExam/show/$registeredOpenExam.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        registeredOpenExam.clearErrors()

        populateValidParams(params)
        params.id = registeredOpenExam.id
        params.version = -1
        controller.update()

        assert view == "/registeredOpenExam/edit"
        assert model.registeredOpenExamInstance != null
        assert model.registeredOpenExamInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/registeredOpenExam/list'

        response.reset()

        populateValidParams(params)
        def registeredOpenExam = new RegisteredOpenExam(params)

        assert registeredOpenExam.save() != null
        assert RegisteredOpenExam.count() == 1

        params.id = registeredOpenExam.id

        controller.delete()

        assert RegisteredOpenExam.count() == 0
        assert RegisteredOpenExam.get(registeredOpenExam.id) == null
        assert response.redirectedUrl == '/registeredOpenExam/list'
    }
}
