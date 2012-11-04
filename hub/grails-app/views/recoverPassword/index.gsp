<!doctype html>
<html>
	<head>
		<g:if test="${!request.xhr}">
		<meta name="layout" content="public">
		</g:if>
		<title><g:message code="hub.recoverPassword.title"/></title>
	</head>
	<body>
	<div class="page_content">
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	
	<g:form action="recoverPassword" method="post">
		<g:message code="hub.recoverPassword.email"/>: <input type="text" name="email">		
		<br>
		<input type="submit" value="<g:message code="hub.recoverPassword.recover"/>">
	</g:form>
	</div>
	</body>
</html>
