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
            companies = Company.findAllByEnabled(true, [sort: "id", order: "desc"])
        }else{
            companies = Company.withCriteria {
                //eq("enabled", true)
                or{
                    ilike("name", "%${params.text}%")
                    ilike("description", "%${params.text}%")
                    ilike("tagsToString", "%${params.text}%")
                }
            }
        }
        groupComaniesInPositions(companies)
        render(contentType: "text/json") {
                array {
                    companies.each{
                        company(id: it.id, enabled: it.enabled, name: it.name, description: it.description, address: it.address, latitude: it.latitude, longitude: it.longitude, positionId: it.positionId, web: it.web?:"", logoSrc:it.logo?g.createLink(controller:'company', action:'logo', id: it.id):resource(dir:'images', file:'avatar_default.jpg'))
                    }
                }
        }
    }

    def about(){
        
    }

    private def groupComaniesInPositions(companies){
        int positionId = 1
        companies.each{ company ->
            
            def foundCompanies = companies.findAll{!it.positionId && company.latitude == it.latitude && company.longitude == it.longitude}

            foundCompanies.each{
                it.positionId = positionId
            }
            positionId ++
        }
        return companies
    }

}
