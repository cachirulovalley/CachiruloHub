package hub

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
}
