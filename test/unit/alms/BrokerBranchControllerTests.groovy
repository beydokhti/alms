package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(BrokerBranchController)
@Mock(BrokerBranch)
class BrokerBranchControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/brokerBranch/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.brokerBranchInstanceList.size() == 0
        assert model.brokerBranchInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.brokerBranchInstance != null
    }

    void testSave() {
        controller.save()

        assert model.brokerBranchInstance != null
        assert view == '/brokerBranch/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/brokerBranch/show/1'
        assert controller.flash.message != null
        assert BrokerBranch.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerBranch/list'

        populateValidParams(params)
        def brokerBranch = new BrokerBranch(params)

        assert brokerBranch.save() != null

        params.id = brokerBranch.id

        def model = controller.show()

        assert model.brokerBranchInstance == brokerBranch
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerBranch/list'

        populateValidParams(params)
        def brokerBranch = new BrokerBranch(params)

        assert brokerBranch.save() != null

        params.id = brokerBranch.id

        def model = controller.edit()

        assert model.brokerBranchInstance == brokerBranch
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerBranch/list'

        response.reset()

        populateValidParams(params)
        def brokerBranch = new BrokerBranch(params)

        assert brokerBranch.save() != null

        // test invalid parameters in update
        params.id = brokerBranch.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/brokerBranch/edit"
        assert model.brokerBranchInstance != null

        brokerBranch.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/brokerBranch/show/$brokerBranch.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        brokerBranch.clearErrors()

        populateValidParams(params)
        params.id = brokerBranch.id
        params.version = -1
        controller.update()

        assert view == "/brokerBranch/edit"
        assert model.brokerBranchInstance != null
        assert model.brokerBranchInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/brokerBranch/list'

        response.reset()

        populateValidParams(params)
        def brokerBranch = new BrokerBranch(params)

        assert brokerBranch.save() != null
        assert BrokerBranch.count() == 1

        params.id = brokerBranch.id

        controller.delete()

        assert BrokerBranch.count() == 0
        assert BrokerBranch.get(brokerBranch.id) == null
        assert response.redirectedUrl == '/brokerBranch/list'
    }
}
