package hub
import grails.converters.*

class HomeController {

    def index() {
        def tags = Tag.list()
        Collections.shuffle(tags)
        [tags: tags]
    }

    def query() {
        [companyInstanceList: Company.findAllByNameIlikeOrDescriptionIlike("%${params.text}%", "%${params.text}%")]
    }
    
    def queryJSON() {
        def companies
        if(!params.text){
            companies = Company.list()
        }else{
            companies = Company.withCriteria {
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
                        company(id: it.id, name: it.name, description: it.description, address: it.address, latitude: it.latitude, longitude: it.longitude, positionId: it.positionId)
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
