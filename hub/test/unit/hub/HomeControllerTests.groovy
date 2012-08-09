package hub



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(HomeController)
@Mock([Company])
class HomeControllerTests {

    void testQueryFindsMatchingCompany() {
		def company = new Company(name: "Empresa molona S.A.", email:"foo@bar.com", password:"foo")
		company.save()
		
        controller.params.text = 'mOloN'
        def model = controller.query()
        assert model.companyInstanceList.size() == 1
        assert model.companyInstanceList[0].id == company.id
        assert model.companyInstanceList[0].name == 'Empresa molona S.A.'
    }
}
