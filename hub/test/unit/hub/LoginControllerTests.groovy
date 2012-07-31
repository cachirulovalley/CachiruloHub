package hub



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(LoginController)
@Mock([Company])
class LoginControllerTests {

    void testLoginOk() {
		def company = new Company(name: "Empresa molona S.A.", email:"foo@bar.com", password:"foo")
		company.save()
		assert Company.count()==1
		assert Company.get(1).password==Company.encrypt('foo')
		
		controller.params.email = 'foo@bar.com'
		controller.params.pass = 'foo'
		controller.login()
	   assert response.redirectedUrl == '/company/edit/1'
    }
}
