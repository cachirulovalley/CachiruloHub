package hub
import grails.converters.*

class HomeController {

    def index() {
    }

    def query() {
        [companyInstanceList: Company.findAllByNameIlikeOrDescriptionIlike("%${params.text}%", "%${params.text}%")]
    }
    
    def queryJSON() {
        def companies
        if(!params.text){
            companies = Company.list()
        }else{
            companies = Company.findAllByNameIlikeOrDescriptionIlike("%${params.text}%", "%${params.text}%")
        }
        render(contentType: "text/json") {
                array {
                    companies.each{
                        company(id: it.id, name: it.name, description: it.description, address: it.address, latitude: it.latitude, longitude: it.longitude)
                    }
                }
        }
    }
}
