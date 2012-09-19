<!doctype html>
<html>
	<head>
		<g:if test="${!request.xhr}">
		<meta name="layout" content="public">
		</g:if>
		<title>Recuperar Clave</title>
	</head>
	<body>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	
	<g:form action="recoverPassword" method="post">
		Email: <input type="text" name="email">		
		<br>
		<input type="submit" value="Recuperar">
	</g:form>
	</body>
</html>
