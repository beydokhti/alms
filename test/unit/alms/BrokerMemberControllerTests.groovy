package alms



import org.junit.*
import grails.test.mixin.*

@TestFor(BrokerMemberController)
@Mock(BrokerMember)
class BrokerMemberControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/brokerMember/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.brokerMemberInstanceList.size() == 0
        assert model.brokerMemberInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.brokerMemberInstance != null
    }

    void testSave() {
        controller.save()

        assert model.brokerMemberInstance != null
        assert view == '/brokerMember/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/brokerMember/show/1'
        assert controller.flash.message != null
        assert BrokerMember.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerMember/list'

        populateValidParams(params)
        def brokerMember = new BrokerMember(params)

        assert brokerMember.save() != null

        params.id = brokerMember.id

        def model = controller.show()

        assert model.brokerMemberInstance == brokerMember
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerMember/list'

        populateValidParams(params)
        def brokerMember = new BrokerMember(params)

        assert brokerMember.save() != null

        params.id = brokerMember.id

        def model = controller.edit()

        assert model.brokerMemberInstance == brokerMember
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/brokerMember/list'

        response.reset()

        populateValidParams(params)
        def brokerMember = new BrokerMember(params)

        assert brokerMember.save() != null

        // test invalid parameters in update
        params.id = brokerMember.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/brokerMember/edit"
        assert model.brokerMemberInstance != null

        brokerMember.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/brokerMember/show/$brokerMember.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        brokerMember.clearErrors()

        populateValidParams(params)
        params.id = brokerMember.id
        params.version = -1
        controller.update()

        assert view == "/brokerMember/edit"
        assert model.brokerMemberInstance != null
        assert model.brokerMemberInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/brokerMember/list'

        response.reset()

        populateValidParams(params)
        def brokerMember = new BrokerMember(params)

        assert brokerMember.save() != null
        assert BrokerMember.count() == 1

        params.id = brokerMember.id

        controller.delete()

        assert BrokerMember.count() == 0
        assert BrokerMember.get(brokerMember.id) == null
        assert response.redirectedUrl == '/brokerMember/list'
    }
}
