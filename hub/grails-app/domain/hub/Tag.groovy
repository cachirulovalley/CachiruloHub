package hub

class Tag {
	String name
	Integer numberOfOccurrences = 1
	static mapWith = "mongo"

    static constraints = {
    	name(blank:false, nullable:false)
    }

    static saveFromAString(tagsString){
    	def tagNames = tagsString.split(",")
    	def tags = []
    	if(tagNames){
        	tagNames.each{ 
        		def tag = Tag.findByName(it)
        		if(tag){
        			tag.numberOfOccurrences++
        		}else{
        		    tag = new Tag(name: it.trim())
        		}
        		tag.save(failOnError:true)
        		tags << tag
        	}
       	}
       	return tags
    }

    def removeOccurrence(){
    	if(this.numberOfOccurrences <= 1){
    		this.delete()
    	}else{
    		this.numberOfOccurrences--
    		this.save()
    	}
    }
}
