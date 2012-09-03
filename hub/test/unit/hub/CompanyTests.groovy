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
@Mock(Tag)
class CompanyTests {
    void testEncryptPassword() {
        def password = "foobar"
        def company = new Company(password: password)
        company.encrypt()
        assert password != company.password
    }
    
    void testEncryptPasswordBeforeSave() {
        def password = "foobar"
        def company = new Company(password: password, name: "foo", email: "foo@bar.com")
        company.beforeInsert()
        company.save()
        assert password != company.password
    }

    void testCreateTagsWhenACompanyIsTagged() {
        def company = new Company(password: "foobar", name: "foo", email: "foo@bar.com")
                        .persistTags("java, groovy")
                        .save()
        assert 2 == Tag.count()
        assert 2 == company.tags.size()
    }

    void testDeleteTagsWhenACompanyIsTagged() {
        def company = new Company(password: "foobar", name: "foo", email: "foo@bar.com")
                        .persistTags("java, groovy")
                        .save()
        company.persistTags("groovy")
        assert 1 == company.tags.size()
    }
}
