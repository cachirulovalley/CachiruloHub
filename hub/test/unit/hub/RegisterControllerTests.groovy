package hub



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(RegisterController)
@Mock([Company])
class RegisterControllerTests {
    def control
    
    void setUp(){
        control = mockFor(grails.plugin.mail.MailService)
        control.demand.sendMail {}
        controller.mailService = control.createMock()
    }
    
    void testIndexShouldHaveANewCompany() {
       def model = controller.index()
       assert model.company instanceof Company
       assert model.company.id == null
    }
    
    void testSaveANewCompanyWithRightData() {
        def size = Company.count()
        controller.params.name = "Empresa molona S.A."
        controller.params.email = "foo@bar.com"
        controller.params.password = "321"
        controller.params.repassword = "321"
        controller.save()
        assert (size + 1) == Company.count()
        assert size == Company.countByEnabled(true)
        control.verify()
        assert response.redirectedUrl == '/company/edit/1'
    }
    
    void testSaveANewCompanyWithIncompleteData() {
        def size = Company.count()
        controller.params.name = "Empresa molona S.A."
        controller.params.email = ""
        controller.params.password = "321"
        controller.params.repassword = "321"
        controller.save()
        assert size == Company.count()
        assert model.company != null
        assert model.company.hasErrors()
        assert view == "/register/index"
    }
    
    void testSaveANewCompanyWithDifferentPasswords() {
        def size = Company.count()
        controller.params.name = "Empresa molona S.A."
        controller.params.email = "foo@bar.com"
        controller.params.password = "123"
        controller.params.repassword = "321"
        controller.save()
        assert size == Company.count()
        assert model.company != null
        assert model.company.hasErrors()
        assert model.company.errors.getFieldError("password") != null
        assert view == "/register/index"
    }
    
    void testConfirmRegistration() {
        def company = new Company(name: "Empresa molona S.A.", email:"foo@bar.com", password:"321")
        company.save()
        assert company.id != null
        controller.params.id = company.key
        controller.confirm()
        assert Company.get(company.id).enabled
        assert response.redirectedUrl == '/company/show/1'
    }
}
