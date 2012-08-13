package hub



import org.junit.*
import grails.test.mixin.*

@TestFor(CompanyController)
@Mock(Company)
class CompanyControllerTests {

    def populateValidMinimunParams(params) {
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
/*
    void testCreate() {
        def model = controller.create()

        assert model.companyInstance != null
    }
*/
    void testSave() {
        controller.save()

        assert model.companyInstance != null
        assert view == '/company/create'

        response.reset()

        populateValidMinimunParams(params)
        controller.save()

        assert response.redirectedUrl == '/company/show/1'
        assert controller.flash.message != null
        assert Company.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/company/list'

        populateValidMinimunParams(params)
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

        populateValidMinimunParams(params)
        def company = new Company(params)
        session.company=company

        assert company.save() != null

        params.id = company.id

        def model = controller.edit()

        assert model.companyInstance == company
    }
/*
    void testUpdateCompanyDefault() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/company/list'

        response.reset()

        populateValidMinimunParams(params)
        def company = new Company(params)

        assert company.save() != null
    }
*/

    void testUpdateCompanyWithRightData() {

        Company.metaClass.isDirty = { //workaround for mockDomain not adding isDirty method.
            println("dirty check called");
        }

        populateValidMinimunParams(params)
        def company = new Company(params)
        session.company = company
        company.save();

        params.id = company.id
        params.name = "another Name"
        params.address = "another Adress"
        params.description = "another Description"
        params.tags = "tag1 tag2"
        params.web = "http://www.anotherweb.com"

        controller.update()

        //Check the data has been updated indeed

        def companyAfterUpdate = Company.get(params.id)
        assert companyAfterUpdate.name==params.name
        assert companyAfterUpdate.address==params.address
        assert companyAfterUpdate.description==params.description
        assert companyAfterUpdate.tags==params.tags
        assert companyAfterUpdate.web==params.web

        //Also that the data not modified is still the same
        assert companyAfterUpdate.email==company.email
        assert companyAfterUpdate.password==company.password
        
        assert response.redirectedUrl == '/company/show/' + company.id
    }

    void testUpdateCompanyWithNameEmpty() {
        populateValidMinimunParams(params)
        def company = new Company(params)
        session.company=company
        company.save();

        params.id = company.id
        params.name = ""

        controller.update()

        assert view == "/company/edit"
        assert model.companyInstance != null
        assert model.companyInstance.hasErrors()
    }

    void testUpdateCompanyWithWrongWeb() {
        populateValidMinimunParams(params)
        def company = new Company(params)
        session.company=company
        company.save();

        params.id = company.id
        params.web = "justaword"

        controller.update()

        assert view == "/company/edit"
        assert model.companyInstance != null
        assert model.companyInstance.hasErrors()
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/company/list'

        response.reset()

        populateValidMinimunParams(params)
        def company = new Company(params)

        assert company.save() != null
        assert Company.count() == 1

        params.id = company.id

        controller.delete()

        assert Company.count() == 0
        assert Company.get(company.id) == null
        assert response.redirectedUrl == '/company/list'
    }

    void testQueryFindsMatchingCompany() {
        populateValidMinimunParams(params)
        def company = new Company(params).save()

        controller.params.text = 'mOloN'
        def model = controller.query()
        assert model.companyInstanceList.size() == 1
        assert model.companyInstanceList[0].id == company.id
        assert model.companyInstanceList[0].name == 'empresa molona'
    }
}
