package hub



import org.junit.*
import grails.test.mixin.*

@TestFor(CompanyController)
@Mock([Company, Tag])
class CompanyControllerTests {
    
    void setUp(){
        def control = mockFor(com.grails.plugins.localizable.GeocodingService)
        control.demand.findLatLngByAddress {}
        controller.geocodingService = control.createMock()
    }

    def populateValidMinimunParams(params) {
        assert params != null
        params["name"] = 'empresa molona'
        params["email"] = 'foo@bar.com'
        params["password"] = 'pass'
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/home'

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
        assert response.redirectedUrl == '/home'

        populateValidMinimunParams(params)
        def company = new Company(params)
        session.company=company

        assert company.save() != null

        params.id = company.id

        def model = controller.edit()

        assert model.companyInstance == company
    }

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
        params.tags = "tag1, tag2"
        params.web = "http://www.anotherweb.com"
        
        controller.update()

        //Check the data has been updated indeed

        def companyAfterUpdate = Company.get(params.id)
        assert companyAfterUpdate.name==params.name
        assert companyAfterUpdate.address==params.address
        assert companyAfterUpdate.description==params.description
        assert companyAfterUpdate.tags.size()==2
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

    void testdelCompanyNotLogged(){
        session.company = null
        def company = new Company(name: "Empresa molona S.A.", email:"foo@bar.com", password:"foo")
        company.save()
        assert Company.count()==1
        controller.delete()
        assert Company.count()==1
        assert flash.message =="La empresa debe autenticarse"
        assert response.redirectedUrl == '/home' 
    }

    void testdelCompanyLogged(){
        def company = new Company(name: "Empresa molona S.A.", email:"foo@bar.com", password:"foo")
        company.save()
        session.company=company
        company.save() 
        controller.delete()
        assert Company.count()==0
        assert flash.message =="La empresa fue dada de baja"
        assert response.redirectedUrl == '/home' 
    }
}
