<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'company.label', default: 'Company')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-company" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-company" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list company">
			
				<g:if test="${companyInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="company.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${companyInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="company.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${companyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
		
				<g:if test="${companyInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="company.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${companyInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.address}">
				<li class="fieldcontain">
					<span id="address-label" class="property-label"><g:message code="company.address.label" default="Address" /></span>
					
						<span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${companyInstance}" field="address"/></span>
					
				</li>
				</g:if>

				<g:if test="${companyInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="company.tags.label" default="Tags" /></span>
					
						<span class="property-value" aria-labelledby="tags-label"><g:fieldValue bean="${companyInstance}" field="tagsToString"/></span>
					
				</li>
				</g:if>

			
				<g:if test="${companyInstance?.web}">
				<li class="fieldcontain">
					<span id="web-label" class="property-label"><g:message code="company.web.label" default="Web" /></span>
					
						<span class="property-value" aria-labelledby="web-label"><g:fieldValue bean="${companyInstance}" field="web"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.logo}">
				<li class="fieldcontain">
					<span id="logo-label" class="property-label"><g:message code="company.logo.label" default="Logo" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.latitude}">
				<li class="fieldcontain">
					<span id="latitude-label" class="property-label"><g:message code="company.latitude.label" default="Latitude" /></span>
					
						<span class="property-value" aria-labelledby="latitude-label"><g:fieldValue bean="${companyInstance}" field="latitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.longitude}">
				<li class="fieldcontain">
					<span id="longitude-label" class="property-label"><g:message code="company.longitude.label" default="Longitude" /></span>
					
						<span class="property-value" aria-labelledby="longitude-label"><g:fieldValue bean="${companyInstance}" field="longitude"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${companyInstance?.twitter}">
				<li class="fieldcontain">
					<span id="twitter-label" class="property-label"><g:message code="company.twitter.label" default="Twitter" /></span>
					
						<span class="property-value" aria-labelledby="twitter-label"><g:fieldValue bean="${companyInstance}" field="twitter"/></span>
					
				</li>
				</g:if>

				<g:if test="${companyInstance?.facebook}">
				<li class="fieldcontain">
					<span id="facebook-label" class="property-label"><g:message code="company.facebook.label" default="Facebook" /></span>
					
						<span class="property-value" aria-labelledby="facebook-label"><g:fieldValue bean="${companyInstance}" field="facebook"/></span>
					
				</li>
				</g:if>

				<g:if test="${companyInstance?.linkedin}">
				<li class="fieldcontain">
					<span id="linkedin-label" class="property-label"><g:message code="company.linkedin.label" default="Linkedin" /></span>
					
						<span class="property-value" aria-labelledby="linkedin-label"><g:fieldValue bean="${companyInstance}" field="linkedin"/></span>
					
				</li>
				</g:if>

			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${companyInstance?.id}" />
					<g:if test="${companyInstance?.email==session.company?.email}">
						<g:link class="edit" action="edit" id="${companyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					</g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
