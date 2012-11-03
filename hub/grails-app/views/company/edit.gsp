<!doctype html>
<html>
	<head>
		<g:if test="${!request.xhr}">
		<meta name="layout" content="public">
		</g:if>
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Empresa')}" />
		<g:set var="perfilName" value="${message(code: 'perfil.label', default: 'Perfil')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="page_content">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
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
				<fieldset>
					<g:actionSubmit action="update" value="${message(code: 'default.button.update.label', default: 'Actualizar')}" />
				</fieldset>
			</g:form>
		</div>
		<div class="page_content">
			<h1><g:message code="default.edit.label" args="[perfilName]" /></h1>
			<g:form method="post" >
				<fieldset>
					<g:render template="perfil"/>
				</fieldset>
				<fieldset>
					<g:actionSubmit action="updatePerfil" value="${message(code: 'default.button.update.label', default: 'Actualizar')}" />
				</fieldset>
			</g:form>
		</div>

		<div class="page_content">
			<h1>Quiero eliminar mi perfil</h1>
			<g:form method="post" >
				<fieldset>
					<g:actionSubmit action="delete" value="${message(code: 'default.button.delete.label', default: 'Eliminar')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
				</fieldset>
			</g:form>
		</div>


	</body>
</html>
