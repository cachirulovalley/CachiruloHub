package hub



import grails.test.mixin.*
import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Tag)
class TagTests {

    void testSaveATagFromAString() {
    	Tag.saveFromAString("groovy")
		assert 1 == Tag.count()
    }

    void testSaveACoupleOfTagsFromAString() {
    	Tag.saveFromAString("groovy, grails, jquery")
		assert 3 == Tag.count()
    }

    void testIncrementOccurrencesWhenAnExistenTagIsSaved() {
    	Tag.saveFromAString("groovy")
    	Tag.saveFromAString("groovy")
		assert 1 == Tag.count()
    }
}
