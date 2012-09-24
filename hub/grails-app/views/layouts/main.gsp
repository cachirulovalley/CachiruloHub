<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:javascript library="jquery"/>
	  	<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="grailsLogo" role="banner"><a href="${createLink(uri: '/')}"><img src="${resource(dir: 'images', file: 'logo.jpg')}" alt="Grails"/></a></div>
		<div class="nav" role="navigation">
			<ul>
				<g:if test="${!session.company}">
					<li><g:link controller="register"><g:message code="hub.layout.main.register"/></g:link></li>
					<li><g:link controller="login"><g:message code="hub.layout.main.login"/></g:link></li>
					<li><g:link controller="recoverPassword"><g:message code="hub.layout.main.recoverPassword"/></g:link></li>
					<li><g:link controller="home" action="about"><g:message code="hub.layout.main.about"/></g:link></li>
				</g:if>
				<g:else>
					<li><g:link controller="company" action="edit"><g:message code="hub.layout.main.profile"/></g:link></li>
					<li><g:link controller="login" action="logout"><g:message code="hub.layout.main.logout"/></g:link></li>
				</g:else>
				<li><span class="lang">
					<label for="title"><g:message code="hub.layout.main.language"/></label>
					<select id="lang" name="lang">						
					 	<option value="en" <g:langCode code='en'>selected</g:langCode>><g:message code="hub.layout.main.English"/></option>
					 	<option value="es" <g:langCode code='es'>selected</g:langCode>><g:message code="hub.layout.main.Spanish"/></option>						 	
					</select>			
					</span>		
				</li>				
			</ul>
		</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<g:javascript src="mainLayout.js"/>
		<r:layoutResources />
	</body>
</html>