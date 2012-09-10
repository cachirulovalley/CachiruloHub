package hub

class Tag {
	String name
	Integer numberOfOccurrences = 1
	static mapWith = "mongo"

    static constraints = {
    	name(blank:false, nullable:false, unique:true)
    }

    static saveFromAString(tagsString){
    	def tagNames = tagsString.split(",")
    	def tags = []
    	if(tagNames){
        	tagNames.each{ name->
			name=name.trim()
        		def tag = Tag.findByName(name)
        		if(tag){
        			tag.numberOfOccurrences++
        		}else{
        		    tag = new Tag(name: name)
        		}
        		tag.save(failOnError:true)
        		tags << tag
        	}
       	}
       	return tags
    }

    def removeOccurrence(){
    	if(this.numberOfOccurrences <= 1 || !this.numberOfOccurrences){
    		this.delete(failOnError:true)
    	}else{
    		this.numberOfOccurrences--
    		this.save()
    	}
    }
}
