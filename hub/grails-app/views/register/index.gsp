<html>
	<head>
		<g:if test="${!request.xhr}">
		<meta name="layout" content="public">
		</g:if>
		<title>Login</title>
	</head>
	<body>
		<g:form action="save">
			Nombre: <g:textField name="name" required="" value="${companyInstance?.name}"/>
			<br/>
			Email: <g:textField name="email" required="" value="${companyInstance?.email}"/>
			<br/>
			Password: <g:passwordField name="password" required="" value=""/>
			<br/>
			Repite Password: <g:passwordField name="repassword" required="" value=""/>
			<br/>
			<input type="submit" value="Registrarse!">
		</g:form>
	</body>
</html>
