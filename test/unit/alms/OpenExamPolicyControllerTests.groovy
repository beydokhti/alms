package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(OpenExamPolicyController)
@Mock(OpenExamPolicy)
class OpenExamPolicyControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/openExamPolicy/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.openExamPolicyInstanceList.size() == 0
        assert model.openExamPolicyInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.openExamPolicyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.openExamPolicyInstance != null
        assert view == '/openExamPolicy/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/openExamPolicy/show/1'
        assert controller.flash.message != null
        assert OpenExamPolicy.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/openExamPolicy/list'

        populateValidParams(params)
        def openExamPolicy = new OpenExamPolicy(params)

        assert openExamPolicy.save() != null

        params.id = openExamPolicy.id

        def model = controller.show()

        assert model.openExamPolicyInstance == openExamPolicy
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/openExamPolicy/list'

        populateValidParams(params)
        def openExamPolicy = new OpenExamPolicy(params)

        assert openExamPolicy.save() != null

        params.id = openExamPolicy.id

        def model = controller.edit()

        assert model.openExamPolicyInstance == openExamPolicy
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/openExamPolicy/list'

        response.reset()

        populateValidParams(params)
        def openExamPolicy = new OpenExamPolicy(params)

        assert openExamPolicy.save() != null

        // test invalid parameters in update
        params.id = openExamPolicy.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/openExamPolicy/edit"
        assert model.openExamPolicyInstance != null

        openExamPolicy.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/openExamPolicy/show/$openExamPolicy.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        openExamPolicy.clearErrors()

        populateValidParams(params)
        params.id = openExamPolicy.id
        params.version = -1
        controller.update()

        assert view == "/openExamPolicy/edit"
        assert model.openExamPolicyInstance != null
        assert model.openExamPolicyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/openExamPolicy/list'

        response.reset()

        populateValidParams(params)
        def openExamPolicy = new OpenExamPolicy(params)

        assert openExamPolicy.save() != null
        assert OpenExamPolicy.count() == 1

        params.id = openExamPolicy.id

        controller.delete()

        assert OpenExamPolicy.count() == 0
        assert OpenExamPolicy.get(openExamPolicy.id) == null
        assert response.redirectedUrl == '/openExamPolicy/list'
    }
}
