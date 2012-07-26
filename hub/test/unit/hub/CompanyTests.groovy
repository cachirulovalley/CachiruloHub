package hub

import static org.junit.Assert.*

import grails.test.mixin.*
import grails.test.mixin.support.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.support.GrailsUnitTestMixin} for usage instructions
 */
@TestMixin(GrailsUnitTestMixin)
@TestFor(Company)
class CompanyTests {
    void testEncryptPassword() {
        def password = "foobar"
        def company = new Company(password: password)
        company.encrypt()
        assert password != company.password
    }
    
    void testEncryptPasswordBeforeSave() {
        def password = "foobar"
        def company = new Company(password: password, name: "foo", email: "foo@bar.com", )
        company.beforeInsert()
        company.save()
        assert password != company.password
    }
}
