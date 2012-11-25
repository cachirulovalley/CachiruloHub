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
					<label for="name"><g:message code="hub.register.name" default="Name"/>:</label><br />
					<g:textField name="name" required="" value="${company?.name}"/>
				</p>
				<p>
					<label for="email"><g:message code="hub.register.email" default="Email"/>:</label><br />
					<g:textField name="email" required="" value="${company?.email}"/>
				</p>
				<p>
					<label for="password"><g:message code="hub.register.password" default="Password"/>:</label><br />
					<g:passwordField name="password" required="" value=""/>
				</p>
				<p>
					<label for="repassword"><g:message code="hub.register.check" default="Repeat your password"/>:</label><br />
					<g:passwordField name="repassword" required="" value=""/>
				</p>
				<p class="submit">
					<input type="submit" value="<g:message code="hub.register.submit" default="Register"/>">
				</p>
			</g:form>
		</div>
	</body>
</html>
