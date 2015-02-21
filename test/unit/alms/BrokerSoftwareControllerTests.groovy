package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(BrokerSoftwareController)
@Mock(BrokerSoftware)
class BrokerSoftwareControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/brokerSoftware/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.brokerSoftwareInstanceList.size() == 0
        assert model.brokerSoftwareInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.brokerSoftwareInstance != null
    }

    void testSave() {
        controller.save()

        assert model.brokerSoftwareInstance != null
        assert view == '/brokerSoftware/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/brokerSoftware/show/1'
        assert controller.flash.message != null
        assert BrokerSoftware.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerSoftware/list'

        populateValidParams(params)
        def brokerSoftware = new BrokerSoftware(params)

        assert brokerSoftware.save() != null

        params.id = brokerSoftware.id

        def model = controller.show()

        assert model.brokerSoftwareInstance == brokerSoftware
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerSoftware/list'

        populateValidParams(params)
        def brokerSoftware = new BrokerSoftware(params)

        assert brokerSoftware.save() != null

        params.id = brokerSoftware.id

        def model = controller.edit()

        assert model.brokerSoftwareInstance == brokerSoftware
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerSoftware/list'

        response.reset()

        populateValidParams(params)
        def brokerSoftware = new BrokerSoftware(params)

        assert brokerSoftware.save() != null

        // test invalid parameters in update
        params.id = brokerSoftware.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/brokerSoftware/edit"
        assert model.brokerSoftwareInstance != null

        brokerSoftware.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/brokerSoftware/show/$brokerSoftware.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        brokerSoftware.clearErrors()

        populateValidParams(params)
        params.id = brokerSoftware.id
        params.version = -1
        controller.update()

        assert view == "/brokerSoftware/edit"
        assert model.brokerSoftwareInstance != null
        assert model.brokerSoftwareInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/brokerSoftware/list'

        response.reset()

        populateValidParams(params)
        def brokerSoftware = new BrokerSoftware(params)

        assert brokerSoftware.save() != null
        assert BrokerSoftware.count() == 1

        params.id = brokerSoftware.id

        controller.delete()

        assert BrokerSoftware.count() == 0
        assert BrokerSoftware.get(brokerSoftware.id) == null
        assert response.redirectedUrl == '/brokerSoftware/list'
    }
}
