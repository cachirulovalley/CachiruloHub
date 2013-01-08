package hub

class SidebarTagLib {

	def tags = { attrs, body ->	
		def tags = Tag.list()
        Collections.shuffle(tags)
        if(tags.size()>40){
        	tags = tags[0..40]
        }
		out << render(template:"/home/tags", model:[tags: tags])
    }

    def companies = { attrs, body ->	
		def companies = Company.findAllByEnabled(true, [sort: "id", order: "desc"])
		out << render(template:"/home/companies", model:[companies: companies])
    }
}
