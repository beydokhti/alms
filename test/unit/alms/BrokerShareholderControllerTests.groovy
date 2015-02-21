package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(BrokerShareholderController)
@Mock(BrokerShareholder)
class BrokerShareholderControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/brokerShareholder/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.brokerShareholderInstanceList.size() == 0
        assert model.brokerShareholderInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.brokerShareholderInstance != null
    }

    void testSave() {
        controller.save()

        assert model.brokerShareholderInstance != null
        assert view == '/brokerShareholder/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/brokerShareholder/show/1'
        assert controller.flash.message != null
        assert BrokerShareholder.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerShareholder/list'

        populateValidParams(params)
        def brokerShareholder = new BrokerShareholder(params)

        assert brokerShareholder.save() != null

        params.id = brokerShareholder.id

        def model = controller.show()

        assert model.brokerShareholderInstance == brokerShareholder
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerShareholder/list'

        populateValidParams(params)
        def brokerShareholder = new BrokerShareholder(params)

        assert brokerShareholder.save() != null

        params.id = brokerShareholder.id

        def model = controller.edit()

        assert model.brokerShareholderInstance == brokerShareholder
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerShareholder/list'

        response.reset()

        populateValidParams(params)
        def brokerShareholder = new BrokerShareholder(params)

        assert brokerShareholder.save() != null

        // test invalid parameters in update
        params.id = brokerShareholder.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/brokerShareholder/edit"
        assert model.brokerShareholderInstance != null

        brokerShareholder.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/brokerShareholder/show/$brokerShareholder.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        brokerShareholder.clearErrors()

        populateValidParams(params)
        params.id = brokerShareholder.id
        params.version = -1
        controller.update()

        assert view == "/brokerShareholder/edit"
        assert model.brokerShareholderInstance != null
        assert model.brokerShareholderInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/brokerShareholder/list'

        response.reset()

        populateValidParams(params)
        def brokerShareholder = new BrokerShareholder(params)

        assert brokerShareholder.save() != null
        assert BrokerShareholder.count() == 1

        params.id = brokerShareholder.id

        controller.delete()

        assert BrokerShareholder.count() == 0
        assert BrokerShareholder.get(brokerShareholder.id) == null
        assert response.redirectedUrl == '/brokerShareholder/list'
    }
}
