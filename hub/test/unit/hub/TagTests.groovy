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
        def tag = Tag.findByName("groovy")
        assert tag.numberOfOccurrences == 1
    	Tag.saveFromAString("groovy")
		assert 1 == Tag.count()
        assert tag.numberOfOccurrences == 2
    }

    void testDecrementOccurrencesWhenAnTagIsRemovedButAlreadyIsUsed(){
        Tag.saveFromAString("groovy")
        Tag.saveFromAString("groovy")

        def tag = Tag.findByName("groovy")
        tag.removeOccurrence()
        
        assert 1 == Tag.count()
        assert tag.numberOfOccurrences == 1
        
    }

    void testDecrementToZeroOccurrencesSholdDeleteTheTag(){
        Tag.saveFromAString("groovy")

        def tag = Tag.findByName("groovy")
        tag.removeOccurrence()
        
        assert 0 == Tag.count()
        
    }
}
