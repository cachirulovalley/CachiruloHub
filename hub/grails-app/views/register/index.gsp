<html>
	<head>
		<meta name="layout" content="main">
		<title>Login</title>
	</head>
	<body>
		<g:form action="">
			Nombre: <g:textField name="name" required="" value="${companyInstance?.name}"/>
			<br/>
			Email: <g:textField name="email" required="" value="${companyInstance?.email}"/>
			<br/>
			Password: <g:passwordField name="password" required="" value=""/>
			<br/>
			Repite Password: <g:passwordField name="repassword" required="" value=""/>
			<br/>
		</g:form>
	</body>
</html>
