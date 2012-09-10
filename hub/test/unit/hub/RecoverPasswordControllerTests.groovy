package hub



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(RecoverPasswordController)
@Mock([Company])
class RecoverPasswordControllerTests {
	def control
	
	void setUp(){
		control = mockFor(grails.plugin.mail.MailService)
		control.demand.sendMail {}
		controller.mailService = control.createMock()
		Company.metaClass.methodMissing = { String name, args ->
			if(name == 'isDirty') {
				def impl = { Object[] vargs ->
					return true
				}
				Company.metaClass."$name" = impl //future calls will use this
				return impl(args)
			}
			else {
				throw new MissingMethodException(name, Company.class, args)
			}
		}
			
	}

    void testRecoverPasswordOK() {
		def company = new Company(name: "Empresa molona S.A.", email:"foo@bar.com", password:"foo")
		company.save()
		assert Company.count()==1
		controller.params.email = "foo@bar.com"
		controller.recoverPassword()
		assert Company.get(1).password!=Company.encrypt('foo')
		assert response.redirectedUrl == '/login/index'
    }
	
	void testRecoverPasswordUnknownCompany() {
		def company = new Company(name: "Empresa molona S.A.", email:"foo@bar.com", password:"foo")
		company.save()
		assert Company.count()==1
		controller.params.email = "fu@bar.com"
		controller.recoverPassword()
		assert Company.get(1).password==Company.encrypt('foo')
		assert flash.message == 'Empresa no registrada'
	}
}
