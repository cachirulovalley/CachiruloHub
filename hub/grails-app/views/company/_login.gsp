<g:if test="${session.company}">
	<g:link class="login" controller="login" action="logout"><g:message code="default.logout.label"/></g:link>
</g:if>
<g:else>
	<g:link class="login" controller="login" action="index"><g:message code="default.login.label"/></g:link>
</g:else>