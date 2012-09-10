package hub

import java.security.*

class Company implements java.io.Serializable{
    String email
    String name
    String password
    String description
    String address
    String web
    String twitter
    String facebook
    String linkedin
    String tagsToString
    byte[] logo
    Double latitude
    Double longitude
    static hasMany = [tags: Tag]
    
    String key
    Boolean enabled
    
    Company(){
        key = UUID.randomUUID().toString()
        enabled = false
    }

    static constraints = {
        email(blank:false, nullable:false, email:true)
        name(blank:false, nullable:false)
        password(blank:false, nullable:false)
        address(nullable:true)
        description(nullable:true)
        web(nullable:true, url:true)
	twitter(nullable:true, url:true)
	facebook(nullable:true, url:true)
	linkedin(nullable:true, url:true)
        logo(nullable:true)
        latitude(nullable:true)
        tagsToString(nullable:true)
        longitude(nullable:true)
    }
    
    static mapWith = "mongo"
    
    def beforeInsert() {
        encrypt()
    }
    
    def beforeUpdate() {
        /*if(isDirty('password')){
            encrypt()
        }*/
    }

    def persistTags(String tags){
        tagsToString = tags?.trim()
        //println this.tags
        this.tags.each{
            it.removeOccurrence()
        }
        if(tags){
            this.tags = Tag.saveFromAString(tags)
        }
        return this
    }
    
    def encrypt(){
        def messageDigest = MessageDigest.getInstance("SHA1")
        messageDigest.update(password.getBytes())
        password = new BigInteger(1, messageDigest.digest()).toString(16).padLeft(40, '0')
    }
	
	static def encrypt(String text){
        def messageDigest = MessageDigest.getInstance("SHA1")
        messageDigest.update(text.getBytes())
        return new BigInteger(1, messageDigest.digest()).toString(16).padLeft(40, '0')
    }

}
