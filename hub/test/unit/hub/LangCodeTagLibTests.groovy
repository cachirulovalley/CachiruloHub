package hub;

import org.junit.*
import grails.test.mixin.*
import org.codehaus.groovy.grails.plugins.testing.GrailsMockHttpServletRequest

@TestFor(LangCodeTagLib)
class LangCodeTagLibTests {
	
	void testLangCodeTagLibLocale() {
		response.locale = new Locale("pt","BR")
		assert applyTemplate('<g:langCode code="pt">Em português!</g:langCode>') == 'Em português!'
		
	}
	
	
	
	void testLangCodeTagLibParam() {
		request.metaClass.invokeMethod = { name, args ->
			if((name == 'getParameter')&&(args==['lang'])) {
				return 'en'
			} else {
				def validMethod = request.metaClass.getMetaMethod(name, args)
				if (validMethod != null) {
					validMethod.invoke(delegate, args)
				} else {
					return request.metaClass.invokeMissingMethod(delegate, name, args)
				}			
			}
		}
		
		
		assert applyTemplate('<g:langCode code="en">In English!</g:langCode>') == 'In English!'
		
	}
}
