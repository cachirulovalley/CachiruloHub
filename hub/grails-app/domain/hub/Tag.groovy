package hub

class Tag {
	String name

    static constraints = {
    	name(blank:false, nullable:false)
    }

    static saveFromAString(tagsString){
    	def tagNames = tagsString.split(",")
    	def tags = []
    	if(tagNames){
        	tagNames.each{ 
        		def tag = Tag.findByName(it)
        		if(!tag){
        		    tag = new Tag(name: it.trim())
        		}
        		tag.save(failOnError:true)
        		tags << tag
        	}
       	}
       	return tags
    }
}
