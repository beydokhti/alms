package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(TermController)
@Mock(Term)
class TermControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/term/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.termInstanceList.size() == 0
        assert model.termInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.termInstance != null
    }

    void testSave() {
        controller.save()

        assert model.termInstance != null
        assert view == '/term/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/term/show/1'
        assert controller.flash.message != null
        assert Term.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/term/list'

        populateValidParams(params)
        def term = new Term(params)

        assert term.save() != null

        params.id = term.id

        def model = controller.show()

        assert model.termInstance == term
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/term/list'

        populateValidParams(params)
        def term = new Term(params)

        assert term.save() != null

        params.id = term.id

        def model = controller.edit()

        assert model.termInstance == term
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/term/list'

        response.reset()

        populateValidParams(params)
        def term = new Term(params)

        assert term.save() != null

        // test invalid parameters in update
        params.id = term.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/term/edit"
        assert model.termInstance != null

        term.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/term/show/$term.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        term.clearErrors()

        populateValidParams(params)
        params.id = term.id
        params.version = -1
        controller.update()

        assert view == "/term/edit"
        assert model.termInstance != null
        assert model.termInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/term/list'

        response.reset()

        populateValidParams(params)
        def term = new Term(params)

        assert term.save() != null
        assert Term.count() == 1

        params.id = term.id

        controller.delete()

        assert Term.count() == 0
        assert Term.get(term.id) == null
        assert response.redirectedUrl == '/term/list'
    }
}
