<!doctype html>
<html>
	<head>
		<g:if test="${!request.xhr}">
		<meta name="layout" content="public">
		</g:if>
		<title><g:message code="hub.recoverPassword.title"/></title>
	</head>
	<body>
	<div class="page_content content_form">
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		
		<g:form action="recoverPassword" method="post">
			<p>
				<label for="email"><g:message code="hub.recoverPassword.email"/>:</label><br />
				<input type="text" name="email" />		
			</p>
			<p class="submit">
				<input type="submit" value="<g:message code="hub.recoverPassword.recover"/>">
			</p>
		</g:form>
	</div>
	</body>
</html>
