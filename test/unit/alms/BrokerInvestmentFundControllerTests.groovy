package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(BrokerInvestmentFundController)
@Mock(BrokerInvestmentFund)
class BrokerInvestmentFundControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/brokerInvestmentFund/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.brokerInvestmentFundInstanceList.size() == 0
        assert model.brokerInvestmentFundInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.brokerInvestmentFundInstance != null
    }

    void testSave() {
        controller.save()

        assert model.brokerInvestmentFundInstance != null
        assert view == '/brokerInvestmentFund/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/brokerInvestmentFund/show/1'
        assert controller.flash.message != null
        assert BrokerInvestmentFund.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerInvestmentFund/list'

        populateValidParams(params)
        def brokerInvestmentFund = new BrokerInvestmentFund(params)

        assert brokerInvestmentFund.save() != null

        params.id = brokerInvestmentFund.id

        def model = controller.show()

        assert model.brokerInvestmentFundInstance == brokerInvestmentFund
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerInvestmentFund/list'

        populateValidParams(params)
        def brokerInvestmentFund = new BrokerInvestmentFund(params)

        assert brokerInvestmentFund.save() != null

        params.id = brokerInvestmentFund.id

        def model = controller.edit()

        assert model.brokerInvestmentFundInstance == brokerInvestmentFund
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerInvestmentFund/list'

        response.reset()

        populateValidParams(params)
        def brokerInvestmentFund = new BrokerInvestmentFund(params)

        assert brokerInvestmentFund.save() != null

        // test invalid parameters in update
        params.id = brokerInvestmentFund.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/brokerInvestmentFund/edit"
        assert model.brokerInvestmentFundInstance != null

        brokerInvestmentFund.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/brokerInvestmentFund/show/$brokerInvestmentFund.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        brokerInvestmentFund.clearErrors()

        populateValidParams(params)
        params.id = brokerInvestmentFund.id
        params.version = -1
        controller.update()

        assert view == "/brokerInvestmentFund/edit"
        assert model.brokerInvestmentFundInstance != null
        assert model.brokerInvestmentFundInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/brokerInvestmentFund/list'

        response.reset()

        populateValidParams(params)
        def brokerInvestmentFund = new BrokerInvestmentFund(params)

        assert brokerInvestmentFund.save() != null
        assert BrokerInvestmentFund.count() == 1

        params.id = brokerInvestmentFund.id

        controller.delete()

        assert BrokerInvestmentFund.count() == 0
        assert BrokerInvestmentFund.get(brokerInvestmentFund.id) == null
        assert response.redirectedUrl == '/brokerInvestmentFund/list'
    }
}
