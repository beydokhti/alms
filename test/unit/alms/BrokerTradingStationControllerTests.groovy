package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(BrokerTradingStationController)
@Mock(BrokerTradingStation)
class BrokerTradingStationControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/brokerTradingStation/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.brokerTradingStationInstanceList.size() == 0
        assert model.brokerTradingStationInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.brokerTradingStationInstance != null
    }

    void testSave() {
        controller.save()

        assert model.brokerTradingStationInstance != null
        assert view == '/brokerTradingStation/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/brokerTradingStation/show/1'
        assert controller.flash.message != null
        assert BrokerTradingStation.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerTradingStation/list'

        populateValidParams(params)
        def brokerTradingStation = new BrokerTradingStation(params)

        assert brokerTradingStation.save() != null

        params.id = brokerTradingStation.id

        def model = controller.show()

        assert model.brokerTradingStationInstance == brokerTradingStation
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerTradingStation/list'

        populateValidParams(params)
        def brokerTradingStation = new BrokerTradingStation(params)

        assert brokerTradingStation.save() != null

        params.id = brokerTradingStation.id

        def model = controller.edit()

        assert model.brokerTradingStationInstance == brokerTradingStation
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerTradingStation/list'

        response.reset()

        populateValidParams(params)
        def brokerTradingStation = new BrokerTradingStation(params)

        assert brokerTradingStation.save() != null

        // test invalid parameters in update
        params.id = brokerTradingStation.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/brokerTradingStation/edit"
        assert model.brokerTradingStationInstance != null

        brokerTradingStation.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/brokerTradingStation/show/$brokerTradingStation.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        brokerTradingStation.clearErrors()

        populateValidParams(params)
        params.id = brokerTradingStation.id
        params.version = -1
        controller.update()

        assert view == "/brokerTradingStation/edit"
        assert model.brokerTradingStationInstance != null
        assert model.brokerTradingStationInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/brokerTradingStation/list'

        response.reset()

        populateValidParams(params)
        def brokerTradingStation = new BrokerTradingStation(params)

        assert brokerTradingStation.save() != null
        assert BrokerTradingStation.count() == 1

        params.id = brokerTradingStation.id

        controller.delete()

        assert BrokerTradingStation.count() == 0
        assert BrokerTradingStation.get(brokerTradingStation.id) == null
        assert response.redirectedUrl == '/brokerTradingStation/list'
    }
}
