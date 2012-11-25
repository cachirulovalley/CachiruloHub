<!doctype html>
<html>
	<head>
		<g:if test="${!request.xhr}">
		<meta name="layout" content="public">
		</g:if>
		<g:set var="entityName" value="${message(code: 'hub.company.objectName', default: 'Company')}" />
		<title>${companyInstance.name}</title>
	</head>
	<body>		

		<div class="page_content page_content_company">
			<g:if test="${flash.message}">
				<div  role="status">${flash.message}</div>
			</g:if>

			<g:if test="${companyInstance?.logo}">
			  <g:if test="${companyInstance?.web}">
				<a href="${companyInstance.web}" target="_blank" class="company_logo">
				  <img src="${createLink(action:'logo', id:companyInstance.id)}" class="logo">
				</a>
			  </g:if>
			  <g:if test="${!companyInstance?.web}">
				 <img src="${createLink(action:'logo', id:companyInstance.id)}" class="logo">
			  </g:if>
			</g:if>

			<g:if test="${companyInstance?.name}">
			  <g:if test="${companyInstance?.web}">
				<h1 class="company_title"><a href="${companyInstance.web}" target="_blank">${companyInstance.name}</a></h1>
			  </g:if>
			  <g:if test="${!companyInstance?.web}">
				 <h1 class="company_title">${companyInstance.name}</h1>
			  </g:if>
			  <br/>
			</g:if>
			
		      <ul class="company_social"> 
		      	<g:if test="${companyInstance?.web}">
					<li><a href="${companyInstance.web}" target="_blank">Web</a></li>
				</g:if>
				<g:if test="${companyInstance?.twitter}">
				<li>
				    <a href="${companyInstance.twitter}" target="_blank"><g:message code="hub.company.twitter" default="Twitter" /></a>
				</li>
				</g:if>

				<g:if test="${companyInstance?.facebook}">
				<li>
				    <a href="${companyInstance.facebook}" target="_blank"><g:message code="hub.company.facebook" default="Facebook" /></a>
				</li>
				</g:if>

				<g:if test="${companyInstance?.linkedin}">
				<li>
				    <a href="${companyInstance.linkedin}" target="_blank"><g:message code="hub.company.linkedin" default="Linkedin" /></a>
				</li>
				</g:if>
				<g:if test="${companyInstance?.email}">
				<li>
				    <a href="mailto:${companyInstance.email}" target="_blank"><g:message code="hub.company.email.contact" default="Contact" /></a>
				</li>
				</g:if>
				</ul>
				
				<g:if test="${companyInstance?.description}">
					<div class="company_description">${companyInstance.description}</div>
				</g:if>
				
				<g:if test="${companyInstance?.tags}">
					<div class="company_tags">
						<strong><g:message code="hub.company.tags" default="Tags" /></strong>: ${companyInstance.tagsToString}
					</div>
				</g:if>
				 
				<g:if test="${companyInstance?.address}">
					<div class="company_address">${companyInstance.address}

						<g:if test="${companyInstance?.latitude && companyInstance?.longitude}">
				      <img src="http://maps.google.com/maps/api/staticmap?size=400x400&markers=%7C${companyInstance?.latitude},${companyInstance?.longitude}&sensor=false"/>
				</g:if>
					</div>
				</g:if>

			<g:form>
				<fieldset >
					<g:hiddenField name="id" value="${companyInstance?.id}" />
					<g:if test="${companyInstance?.email==session.company?.email}">
						<g:link  action="edit" id="${companyInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					</g:if>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
