<html>
	<head>
		<g:if test="${!request.xhr}">
		<meta name="layout" content="public">
		</g:if>
		<title>Register</title>
	</head>
	<body>
		<div class="page_content content_form">
			<g:form action="save">
				<p>
					<label for="name">Nombre:</label><br />
					<g:textField name="name" required="" value="${company?.name}"/>
				</p>
				<p>
					<label for="email">E-mail:</label><br />
					<g:textField name="email" required="" value="${company?.email}"/>
				</p>
				<p>
					<label for="password">Password:</label><br />
					<g:passwordField name="password" required="" value=""/>
				</p>
				<p>
					<label for="repassword">Repite el password:</label><br />
					<g:passwordField name="repassword" required="" value=""/>
				</p>
				<p class="submit">
					<input type="submit" value="Registrarme">
				</p>
			</g:form>
		</div>
	</body>
</html>
