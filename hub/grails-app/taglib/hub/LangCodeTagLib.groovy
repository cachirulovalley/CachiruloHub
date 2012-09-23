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
		def value = (param == null) ? locale : param			
		if(value.equals(attrs.code)) {	
			out << body()
		} 
	}	
}
