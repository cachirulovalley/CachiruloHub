package hub

class Tag {
	String name
	Integer numberOfOccurrences = 1

    static constraints = {
    	name(blank:false, nullable:false)
    }

    static saveFromAString(tagsString){
    	def tagNames = tagsString.split(",")
    	tagNames.each{ name ->
    		def tag = Tag.findByName(name)
    		if(tag){
    			tag.numberOfOccurrences++
    		}else{
    		    tag = new Tag(name: name.trim())
    		}
    		tag.save(failOnError:true)
    	}
    }
}
