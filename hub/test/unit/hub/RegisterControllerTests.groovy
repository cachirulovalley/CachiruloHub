package hub



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(RegisterController)
@Mock([Company])
class RegisterControllerTests {
    
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
}
