<!doctype html>
<html>
	<head>
		<g:if test="${!request.xhr}">
		<meta name="layout" content="public">
		</g:if>
		<g:set var="entityName" value="${message(code: 'hub.company.objectName', default: 'Company')}" />		
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="page_content content_form content_form_perfil">
			<h2><g:message code="default.edit.label" args="[entityName]" /></h2>
			<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${companyInstance}">
			<ul class="errors">
				<g:eachError bean="${companyInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form method="post"  enctype="multipart/form-data">
				<g:hiddenField name="id" value="${companyInstance?.id}" />
				<g:hiddenField name="version" value="${companyInstance?.version}" />
				<fieldset>
					<g:render template="form"/>
				</fieldset>
				<fieldset class="submit">
					<g:actionSubmit action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
			
			<h2><g:message code="hub.company.profile" default="Company's Profile:" /></h2>
			<g:form method="post" >
				<fieldset>
					<g:render template="perfil"/>
				</fieldset>
				<fieldset class="submit">
					<g:actionSubmit action="updatePerfil" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
			
			<h2><g:message code="hub.company.delete" default="I want to remove my profile" /></h2>
			<g:form method="post" >
				<fieldset class="submit">
					<g:actionSubmit action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'hub.company.confirm', default: 'Are you sure?')}');"/>
				</fieldset>
			</g:form>
		</div>


	</body>
</html>
