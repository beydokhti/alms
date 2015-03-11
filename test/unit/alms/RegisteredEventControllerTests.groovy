package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(RegisteredEventController)
@Mock(RegisteredEvent)
class RegisteredEventControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/registeredEvent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.registeredEventInstanceList.size() == 0
        assert model.registeredEventInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.registeredEventInstance != null
    }

    void testSave() {
        controller.save()

        assert model.registeredEventInstance != null
        assert view == '/registeredEvent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/registeredEvent/show/1'
        assert controller.flash.message != null
        assert RegisteredEvent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/registeredEvent/list'

        populateValidParams(params)
        def registeredEvent = new RegisteredEvent(params)

        assert registeredEvent.save() != null

        params.id = registeredEvent.id

        def model = controller.show()

        assert model.registeredEventInstance == registeredEvent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/registeredEvent/list'

        populateValidParams(params)
        def registeredEvent = new RegisteredEvent(params)

        assert registeredEvent.save() != null

        params.id = registeredEvent.id

        def model = controller.edit()

        assert model.registeredEventInstance == registeredEvent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/registeredEvent/list'

        response.reset()

        populateValidParams(params)
        def registeredEvent = new RegisteredEvent(params)

        assert registeredEvent.save() != null

        // test invalid parameters in update
        params.id = registeredEvent.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/registeredEvent/edit"
        assert model.registeredEventInstance != null

        registeredEvent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/registeredEvent/show/$registeredEvent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        registeredEvent.clearErrors()

        populateValidParams(params)
        params.id = registeredEvent.id
        params.version = -1
        controller.update()

        assert view == "/registeredEvent/edit"
        assert model.registeredEventInstance != null
        assert model.registeredEventInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/registeredEvent/list'

        response.reset()

        populateValidParams(params)
        def registeredEvent = new RegisteredEvent(params)

        assert registeredEvent.save() != null
        assert RegisteredEvent.count() == 1

        params.id = registeredEvent.id

        controller.delete()

        assert RegisteredEvent.count() == 0
        assert RegisteredEvent.get(registeredEvent.id) == null
        assert response.redirectedUrl == '/registeredEvent/list'
    }
}
