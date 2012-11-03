package hub

class SidebarTagLib {

	def tags = { attrs, body ->	
		def tags = Tag.list()
        Collections.shuffle(tags)
		out << render(template:"/home/tags", model:[tags: tags])
    }

    def companies = { attrs, body ->	
		def companies = Company.list()
		out << render(template:"/home/companies", model:[companies: companies])
    }
}
