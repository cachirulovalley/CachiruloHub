package hub



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(RegisterController)
class RegisterControllerTests {
    
    void testRegisterIndexShouldHaveANewCompany() {
       def model = controller.index()
       assert model.company instanceof Company
       assert model.company.id == null
    }
}
