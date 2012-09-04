


<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="company.name.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${companyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="company.address.label" default="Dirección" />
		
	</label>
	<g:textField name="address" value="${companyInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="company.description.label" default="Descripción" />
		
	</label>
	<g:textArea name="description" value="${companyInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="company.tag.label" default="Tags" />
		
	</label>
	<g:textField  name="tags" value="${companyInstance?.tagsToString}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'web', 'error')} ">
	<label for="web">
		<g:message code="company.web.label" default="Web" />
		
	</label>
	<g:field type="url" name="web" value="${companyInstance?.web}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'logo', 'error')} ">
	<label for="logo">
		<g:message code="company.logo.label" default="Logo" />
		
	</label>
	<input type="file" id="logo" name="logo" />
</div>
%{--
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'latitude', 'error')} required">
	<label for="latitude">
		<g:message code="company.latitude.label" default="Latitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="latitude" value="${fieldValue(bean: companyInstance, field: 'latitude')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'longitude', 'error')} required">
	<label for="longitude">
		<g:message code="company.longitude.label" default="Longitude" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longitude" value="${fieldValue(bean: companyInstance, field: 'longitude')}" required=""/>
</div>
--}% 
