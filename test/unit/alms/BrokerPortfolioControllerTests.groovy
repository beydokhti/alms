package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(BrokerPortfolioController)
@Mock(BrokerPortfolio)
class BrokerPortfolioControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/brokerPortfolio/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.brokerPortfolioInstanceList.size() == 0
        assert model.brokerPortfolioInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.brokerPortfolioInstance != null
    }

    void testSave() {
        controller.save()

        assert model.brokerPortfolioInstance != null
        assert view == '/brokerPortfolio/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/brokerPortfolio/show/1'
        assert controller.flash.message != null
        assert BrokerPortfolio.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerPortfolio/list'

        populateValidParams(params)
        def brokerPortfolio = new BrokerPortfolio(params)

        assert brokerPortfolio.save() != null

        params.id = brokerPortfolio.id

        def model = controller.show()

        assert model.brokerPortfolioInstance == brokerPortfolio
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerPortfolio/list'

        populateValidParams(params)
        def brokerPortfolio = new BrokerPortfolio(params)

        assert brokerPortfolio.save() != null

        params.id = brokerPortfolio.id

        def model = controller.edit()

        assert model.brokerPortfolioInstance == brokerPortfolio
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerPortfolio/list'

        response.reset()

        populateValidParams(params)
        def brokerPortfolio = new BrokerPortfolio(params)

        assert brokerPortfolio.save() != null

        // test invalid parameters in update
        params.id = brokerPortfolio.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/brokerPortfolio/edit"
        assert model.brokerPortfolioInstance != null

        brokerPortfolio.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/brokerPortfolio/show/$brokerPortfolio.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        brokerPortfolio.clearErrors()

        populateValidParams(params)
        params.id = brokerPortfolio.id
        params.version = -1
        controller.update()

        assert view == "/brokerPortfolio/edit"
        assert model.brokerPortfolioInstance != null
        assert model.brokerPortfolioInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/brokerPortfolio/list'

        response.reset()

        populateValidParams(params)
        def brokerPortfolio = new BrokerPortfolio(params)

        assert brokerPortfolio.save() != null
        assert BrokerPortfolio.count() == 1

        params.id = brokerPortfolio.id

        controller.delete()

        assert BrokerPortfolio.count() == 0
        assert BrokerPortfolio.get(brokerPortfolio.id) == null
        assert response.redirectedUrl == '/brokerPortfolio/list'
    }
}
