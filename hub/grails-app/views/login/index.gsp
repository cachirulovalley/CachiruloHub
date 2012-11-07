<!doctype html>
<html>
	<head>
		<g:if test="${!request.xhr}">
		<meta name="layout" content="public">
		</g:if>
		<title><g:message code="hub.login.title"/></title>
	</head>
	<body>
		<div class="page_content content_form">
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<g:if test="${error}">
				<ul class="errors" role="alert">
					<li><g:message code="${error}"/></li>
				</ul>
			</g:if>	
			<g:form action="login" method="post">
				<p>
					<label for="email"><g:message code="hub.login.email"/>:</label><br />
					<input type="text" name="email">
				</p>
				<p>
					<label for="password"><g:message code="hub.login.password"/>:</label><br />
					<input type="password" name="password">
				</p>
				<p class="submit">
					<input type="submit" value="<g:message code="hub.login.enter"/>">
				</p>
			</g:form>
			<div class="recover">
				<g:remoteLink controller="recoverPassword" update="panelContent" onComplete="showPanel(false);if(supports_history_api()){history.pushState(null, null, '${createLink(controller:'recoverPassword')}');}"><g:message code="hub.login.recover"/></g:remoteLink>
			</div>
	</div>
	</body>
</html>
