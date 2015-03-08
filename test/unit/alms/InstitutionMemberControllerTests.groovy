package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(InstitutionMemberController)
@Mock(InstitutionMember)
class InstitutionMemberControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/institutionMember/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.institutionMemberInstanceList.size() == 0
        assert model.institutionMemberInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.institutionMemberInstance != null
    }

    void testSave() {
        controller.save()

        assert model.institutionMemberInstance != null
        assert view == '/institutionMember/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/institutionMember/show/1'
        assert controller.flash.message != null
        assert InstitutionMember.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/institutionMember/list'

        populateValidParams(params)
        def institutionMember = new InstitutionMember(params)

        assert institutionMember.save() != null

        params.id = institutionMember.id

        def model = controller.show()

        assert model.institutionMemberInstance == institutionMember
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/institutionMember/list'

        populateValidParams(params)
        def institutionMember = new InstitutionMember(params)

        assert institutionMember.save() != null

        params.id = institutionMember.id

        def model = controller.edit()

        assert model.institutionMemberInstance == institutionMember
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/institutionMember/list'

        response.reset()

        populateValidParams(params)
        def institutionMember = new InstitutionMember(params)

        assert institutionMember.save() != null

        // test invalid parameters in update
        params.id = institutionMember.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/institutionMember/edit"
        assert model.institutionMemberInstance != null

        institutionMember.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/institutionMember/show/$institutionMember.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        institutionMember.clearErrors()

        populateValidParams(params)
        params.id = institutionMember.id
        params.version = -1
        controller.update()

        assert view == "/institutionMember/edit"
        assert model.institutionMemberInstance != null
        assert model.institutionMemberInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/institutionMember/list'

        response.reset()

        populateValidParams(params)
        def institutionMember = new InstitutionMember(params)

        assert institutionMember.save() != null
        assert InstitutionMember.count() == 1

        params.id = institutionMember.id

        controller.delete()

        assert InstitutionMember.count() == 0
        assert InstitutionMember.get(institutionMember.id) == null
        assert response.redirectedUrl == '/institutionMember/list'
    }
}
