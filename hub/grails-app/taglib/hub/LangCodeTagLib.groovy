package hub

class LangCodeTagLib {
	/**
	 * Checks whether current Locale's ISO language code is equal to code.
	 *
	 * @attr code REQUIRED a ISO 630 two letter language code
	 */
	
	def langCode = { attrs, body ->	
		def locale = response.locale.language
		def param = request.getParameter("lang")
		//System.out.println("query param: "+request.getParameter("lang")+", code: "+attrs.code+",locale: "+locale)
		def value = (param == null) ? locale : param	
		System.out.println("query param: "+request.getParameter("lang")+",locale: "+locale+", value: "+value+", code: "+attrs.code)
		if(value.equals(attrs.code)) {	
			out << body()
		} 
	}	
}
