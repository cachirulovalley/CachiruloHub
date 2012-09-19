<!doctype html>
<html>
	<head>
		<g:if test="${!request.xhr}">
		<meta name="layout" content="public">
		</g:if>
		<title>Login</title>
	</head>
	<body>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:if test="${error}">
		<ul class="errors" role="alert">
			<li><g:message code="${error}"/></li>
		</ul>
	</g:if>
	<g:form action="login" method="post">
		Email: <input type="text" name="email">
		<br/>
		Password: <input type="password" name="password">
		<br>
		<input type="submit" value="Entrar">
	</g:form>
	<g:link controller="recoverPassword">Recuperar Clave</g:link>
	</body>
</html>
