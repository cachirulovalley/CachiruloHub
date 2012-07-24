package hub



import org.junit.*
import grails.test.mixin.*

@TestFor(CompanyController)
@Mock(Company)
class CompanyControllerTests {

    def populateValidParams(params) {
        assert params != null
        params["name"] = 'empresa molona'
        params["email"] = 'foo@bar.com'
        params["password"] = 'pass'
    }

    void testIndex() {
        controller.index()
        assert "/company/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.companyInstanceList.size() == 0
        assert model.companyInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.companyInstance != null
    }

    void testSave() {
        controller.save()

        assert model.companyInstance != null
        assert view == '/company/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/company/show/1'
        assert controller.flash.message != null
        assert Company.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/company/list'

        populateValidParams(params)
        def company = new Company(params)

        assert company.save() != null

        params.id = company.id

        def model = controller.show()

        assert model.companyInstance == company
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/company/list'

        populateValidParams(params)
        def company = new Company(params)

        assert company.save() != null

        params.id = company.id

        def model = controller.edit()

        assert model.companyInstance == company
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/company/list'

        response.reset()

        populateValidParams(params)
        def company = new Company(params)

        assert company.save() != null

        // test invalid parameters in update
        params.id = company.id
        params.name = ""

        controller.update()

        assert view == "/company/edit"
        assert model.companyInstance != null

        company.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/company/show/$company.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        company.clearErrors()

        populateValidParams(params)
        params.id = company.id
        params.version = -1
        controller.update()

        assert view == "/company/edit"
        assert model.companyInstance != null
        assert model.companyInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/company/list'

        response.reset()

        populateValidParams(params)
        def company = new Company(params)

        assert company.save() != null
        assert Company.count() == 1

        params.id = company.id

        controller.delete()

        assert Company.count() == 0
        assert Company.get(company.id) == null
        assert response.redirectedUrl == '/company/list'
    }
}
