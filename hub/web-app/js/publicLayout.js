$('select#lang').change(function(){	
	$("select#lang")
	var selection = $(this).children(':selected').prop('value');	
	var url = parseLanguage(window.location,selection);
	window.location = url;    
});

function parseLanguage(location,language) {
	var url = ''+location;
	pos1 = url.indexOf('?')
	if( pos1 === -1) {
		return url + '?lang=' + language;
	} else { 
		pos2 = url.indexOf('lang=');		
		if(pos2 === -1) {
			return url + '&lang=' + language;
		} else if(url.length === (pos2+7)) {	
			return url.substring(0,pos2) + 'lang=' + language;
		} 
		  else {
			return url.substring(0,pos2) + 'lang=' + language + url.substring(pos2+7, url.length);
		}
	} 
}