package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(ObtainedCertificateController)
@Mock(ObtainedCertificate)
class ObtainedCertificateControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/obtainedCertificate/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.obtainedCertificateInstanceList.size() == 0
        assert model.obtainedCertificateInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.obtainedCertificateInstance != null
    }

    void testSave() {
        controller.save()

        assert model.obtainedCertificateInstance != null
        assert view == '/obtainedCertificate/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/obtainedCertificate/show/1'
        assert controller.flash.message != null
        assert ObtainedCertificate.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/obtainedCertificate/list'

        populateValidParams(params)
        def obtainedCertificate = new ObtainedCertificate(params)

        assert obtainedCertificate.save() != null

        params.id = obtainedCertificate.id

        def model = controller.show()

        assert model.obtainedCertificateInstance == obtainedCertificate
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/obtainedCertificate/list'

        populateValidParams(params)
        def obtainedCertificate = new ObtainedCertificate(params)

        assert obtainedCertificate.save() != null

        params.id = obtainedCertificate.id

        def model = controller.edit()

        assert model.obtainedCertificateInstance == obtainedCertificate
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/obtainedCertificate/list'

        response.reset()

        populateValidParams(params)
        def obtainedCertificate = new ObtainedCertificate(params)

        assert obtainedCertificate.save() != null

        // test invalid parameters in update
        params.id = obtainedCertificate.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/obtainedCertificate/edit"
        assert model.obtainedCertificateInstance != null

        obtainedCertificate.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/obtainedCertificate/show/$obtainedCertificate.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        obtainedCertificate.clearErrors()

        populateValidParams(params)
        params.id = obtainedCertificate.id
        params.version = -1
        controller.update()

        assert view == "/obtainedCertificate/edit"
        assert model.obtainedCertificateInstance != null
        assert model.obtainedCertificateInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/obtainedCertificate/list'

        response.reset()

        populateValidParams(params)
        def obtainedCertificate = new ObtainedCertificate(params)

        assert obtainedCertificate.save() != null
        assert ObtainedCertificate.count() == 1

        params.id = obtainedCertificate.id

        controller.delete()

        assert ObtainedCertificate.count() == 0
        assert ObtainedCertificate.get(obtainedCertificate.id) == null
        assert response.redirectedUrl == '/obtainedCertificate/list'
    }
}
