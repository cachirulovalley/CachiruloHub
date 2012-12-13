package hub

class SidebarTagLib {

	def tags = { attrs, body ->	
		def tags = Tag.list()
        Collections.shuffle(tags)
		out << render(template:"/home/tags", model:[tags: tags])
    }

    def companies = { attrs, body ->	
		def companies = Company.findAllByEnabled(true)
		out << render(template:"/home/companies", model:[companies: companies])
    }
}
