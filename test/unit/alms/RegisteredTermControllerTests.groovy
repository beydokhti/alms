package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(RegisteredTermController)
@Mock(RegisteredTerm)
class RegisteredTermControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/registeredTerm/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.registeredTermInstanceList.size() == 0
        assert model.registeredTermInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.registeredTermInstance != null
    }

    void testSave() {
        controller.save()

        assert model.registeredTermInstance != null
        assert view == '/registeredTerm/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/registeredTerm/show/1'
        assert controller.flash.message != null
        assert RegisteredTerm.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/registeredTerm/list'

        populateValidParams(params)
        def registeredTerm = new RegisteredTerm(params)

        assert registeredTerm.save() != null

        params.id = registeredTerm.id

        def model = controller.show()

        assert model.registeredTermInstance == registeredTerm
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/registeredTerm/list'

        populateValidParams(params)
        def registeredTerm = new RegisteredTerm(params)

        assert registeredTerm.save() != null

        params.id = registeredTerm.id

        def model = controller.edit()

        assert model.registeredTermInstance == registeredTerm
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/registeredTerm/list'

        response.reset()

        populateValidParams(params)
        def registeredTerm = new RegisteredTerm(params)

        assert registeredTerm.save() != null

        // test invalid parameters in update
        params.id = registeredTerm.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/registeredTerm/edit"
        assert model.registeredTermInstance != null

        registeredTerm.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/registeredTerm/show/$registeredTerm.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        registeredTerm.clearErrors()

        populateValidParams(params)
        params.id = registeredTerm.id
        params.version = -1
        controller.update()

        assert view == "/registeredTerm/edit"
        assert model.registeredTermInstance != null
        assert model.registeredTermInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/registeredTerm/list'

        response.reset()

        populateValidParams(params)
        def registeredTerm = new RegisteredTerm(params)

        assert registeredTerm.save() != null
        assert RegisteredTerm.count() == 1

        params.id = registeredTerm.id

        controller.delete()

        assert RegisteredTerm.count() == 0
        assert RegisteredTerm.get(registeredTerm.id) == null
        assert response.redirectedUrl == '/registeredTerm/list'
    }
}
