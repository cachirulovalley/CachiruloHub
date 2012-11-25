<html>
<head>
</head>
<body>
	<h1><g:message code="hub.template.confirmation.header" default="You are now registered at"/> CachiruloHub</h1>
	<p><g:message code="hub.template.confirmation.search" default="Confirm you email address to show on search results at"/> <a href="${createLink(absolute:true, controller:"register", action:"confirm", id:company.key)}">${createLink(absolute:true, controller:"register", action:"confirm", id:company.key)}</a></p>
</body>
</html>