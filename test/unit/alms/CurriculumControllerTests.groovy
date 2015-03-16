package alms


import org.junit.*
import grails.test.mixin.*

@TestFor(CurriculumController)
@Mock(Curriculum)
class CurriculumControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/curriculum/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.curriculumInstanceList.size() == 0
        assert model.curriculumInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.curriculumInstance != null
    }

    void testSave() {
        controller.save()

        assert model.curriculumInstance != null
        assert view == '/curriculum/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/curriculum/show/1'
        assert controller.flash.message != null
        assert Curriculum.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/curriculum/list'

        populateValidParams(params)
        def curriculum = new Curriculum(params)

        assert curriculum.save() != null

        params.id = curriculum.id

        def model = controller.show()

        assert model.curriculumInstance == curriculum
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/curriculum/list'

        populateValidParams(params)
        def curriculum = new Curriculum(params)

        assert curriculum.save() != null

        params.id = curriculum.id

        def model = controller.edit()

        assert model.curriculumInstance == curriculum
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/curriculum/list'

        response.reset()

        populateValidParams(params)
        def curriculum = new Curriculum(params)

        assert curriculum.save() != null

        // test invalid parameters in update
        params.id = curriculum.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/curriculum/edit"
        assert model.curriculumInstance != null

        curriculum.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/curriculum/show/$curriculum.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        curriculum.clearErrors()

        populateValidParams(params)
        params.id = curriculum.id
        params.version = -1
        controller.update()

        assert view == "/curriculum/edit"
        assert model.curriculumInstance != null
        assert model.curriculumInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/curriculum/list'

        response.reset()

        populateValidParams(params)
        def curriculum = new Curriculum(params)

        assert curriculum.save() != null
        assert Curriculum.count() == 1

        params.id = curriculum.id

        controller.delete()

        assert Curriculum.count() == 0
        assert Curriculum.get(curriculum.id) == null
        assert response.redirectedUrl == '/curriculum/list'
    }
}
