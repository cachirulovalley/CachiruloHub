package hub

import java.security.*

class Company {
    String email
    String name
    String password
    String description
    String address
    String web
    byte[] logo
    Double latitude
    Double longitude
    
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
        description(nullable:true)
        address(nullable:true)
        web(nullable:true, url:true)
        logo(nullable:true)
        latitude(nullable:true)
        longitude(nullable:true)
    }
    
    def beforeInsert() {
        encrypt()
    }
    
    def beforeUpdate() {
        if(isDirty('password')){
            encrypt()
        }
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
