<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="hub.template.name" default="Name" />
		<span class="required-indicator">*</span> :
	</label><br />
	<g:textField name="name" required="" value="${companyInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="hub.template.form.address" default="Address" />:
	</label><br />
	<g:textField name="address" value="${companyInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="hub.template.form.description" default="Description" />:
	</label><br />
	<g:textArea name="description" value="${companyInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="hub.template.form.tags" default="Tags" />:
	</label><br />
	<g:textField  name="tags" value="${companyInstance?.tagsToString}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'web', 'error')} ">
	<label for="web">
		<g:message code="hub.template.form.web" default="Web" />:
	</label><br />
	<g:field type="url" name="web" value="${companyInstance?.web}"/>
</div>

<div class="fieldcontain fieldcontainlogo ${hasErrors(bean: companyInstance, field: 'logo', 'error')} ">
	<label for="logo">
		<g:message code="hub.template.form.logo" default="Logo" />:
	</label><br />
	<input type="file" id="logo" name="logo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'twitter', 'error')} ">
	<label for="twitter">
		<g:message code="hub.template.form.twitter" default="Twitter" />:
	</label><br />
	<g:field type="url" name="twitter" value="${companyInstance?.twitter}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'facebook', 'error')} ">
	<label for="facebook">
		<g:message code="hub.template.form.facebook" default="Facebook" />:
	</label><br />
	<g:field type="url" name="facebook" value="${companyInstance?.facebook}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'linkedin', 'error')} ">
	<label for="linkedin">
		<g:message code="hub.template.form.linkedin" default="Linkedin" />:
	</label><br />
	<g:field type="url" name="linkedin" value="${companyInstance?.linkedin}"/>
</div>