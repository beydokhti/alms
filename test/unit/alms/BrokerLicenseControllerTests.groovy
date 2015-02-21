package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(BrokerLicenseController)
@Mock(BrokerLicense)
class BrokerLicenseControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/brokerLicense/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.brokerLicenseInstanceList.size() == 0
        assert model.brokerLicenseInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.brokerLicenseInstance != null
    }

    void testSave() {
        controller.save()

        assert model.brokerLicenseInstance != null
        assert view == '/brokerLicense/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/brokerLicense/show/1'
        assert controller.flash.message != null
        assert BrokerLicense.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerLicense/list'

        populateValidParams(params)
        def brokerLicense = new BrokerLicense(params)

        assert brokerLicense.save() != null

        params.id = brokerLicense.id

        def model = controller.show()

        assert model.brokerLicenseInstance == brokerLicense
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerLicense/list'

        populateValidParams(params)
        def brokerLicense = new BrokerLicense(params)

        assert brokerLicense.save() != null

        params.id = brokerLicense.id

        def model = controller.edit()

        assert model.brokerLicenseInstance == brokerLicense
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerLicense/list'

        response.reset()

        populateValidParams(params)
        def brokerLicense = new BrokerLicense(params)

        assert brokerLicense.save() != null

        // test invalid parameters in update
        params.id = brokerLicense.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/brokerLicense/edit"
        assert model.brokerLicenseInstance != null

        brokerLicense.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/brokerLicense/show/$brokerLicense.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        brokerLicense.clearErrors()

        populateValidParams(params)
        params.id = brokerLicense.id
        params.version = -1
        controller.update()

        assert view == "/brokerLicense/edit"
        assert model.brokerLicenseInstance != null
        assert model.brokerLicenseInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/brokerLicense/list'

        response.reset()

        populateValidParams(params)
        def brokerLicense = new BrokerLicense(params)

        assert brokerLicense.save() != null
        assert BrokerLicense.count() == 1

        params.id = brokerLicense.id

        controller.delete()

        assert BrokerLicense.count() == 0
        assert BrokerLicense.get(brokerLicense.id) == null
        assert response.redirectedUrl == '/brokerLicense/list'
    }
}
