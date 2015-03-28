package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(OpenExamResultController)
@Mock(OpenExamResult)
class OpenExamResultControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/openExamResult/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.openExamResultInstanceList.size() == 0
        assert model.openExamResultInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.openExamResultInstance != null
    }

    void testSave() {
        controller.save()

        assert model.openExamResultInstance != null
        assert view == '/openExamResult/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/openExamResult/show/1'
        assert controller.flash.message != null
        assert OpenExamResult.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/openExamResult/list'

        populateValidParams(params)
        def openExamResult = new OpenExamResult(params)

        assert openExamResult.save() != null

        params.id = openExamResult.id

        def model = controller.show()

        assert model.openExamResultInstance == openExamResult
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/openExamResult/list'

        populateValidParams(params)
        def openExamResult = new OpenExamResult(params)

        assert openExamResult.save() != null

        params.id = openExamResult.id

        def model = controller.edit()

        assert model.openExamResultInstance == openExamResult
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/openExamResult/list'

        response.reset()

        populateValidParams(params)
        def openExamResult = new OpenExamResult(params)

        assert openExamResult.save() != null

        // test invalid parameters in update
        params.id = openExamResult.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/openExamResult/edit"
        assert model.openExamResultInstance != null

        openExamResult.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/openExamResult/show/$openExamResult.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        openExamResult.clearErrors()

        populateValidParams(params)
        params.id = openExamResult.id
        params.version = -1
        controller.update()

        assert view == "/openExamResult/edit"
        assert model.openExamResultInstance != null
        assert model.openExamResultInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/openExamResult/list'

        response.reset()

        populateValidParams(params)
        def openExamResult = new OpenExamResult(params)

        assert openExamResult.save() != null
        assert OpenExamResult.count() == 1

        params.id = openExamResult.id

        controller.delete()

        assert OpenExamResult.count() == 0
        assert OpenExamResult.get(openExamResult.id) == null
        assert response.redirectedUrl == '/openExamResult/list'
    }
}
