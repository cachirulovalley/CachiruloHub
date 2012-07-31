<%@ page import="hub.Company" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Login</title>
	</head>
	<body>
	<g:form action="login" method="post">
		Email: <input type="text" name="email">
		<br/>
		Password: <input type="password" name="password">
		<br>
		<input type="submit" value="Entrar">
	</g:form>
	</body>
</html>
