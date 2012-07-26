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
			Password: <g:passwordField name="name" required="" value=""/>
			<br/>
			Repite Password: <g:textField name="name" required="" value=""/>
			<br/>
		</g:form>
	</body>
</html>
