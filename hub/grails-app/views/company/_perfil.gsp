 
<%@ page import="hub.Company" %>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="company.newemail.label" default="Email" />
		<span class="required-indicator">*</span> :
	</label><br />
	<g:field type="email" name="email" value="${companyInstance?.email}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'oldpassword', 'error')} required">
	<label for="oldpassword">
		<g:message code="company.password.label" default="Contraseña" />
		<span class="required-indicator">*</span> :
	</label><br />
	<g:passwordField name="oldpassword" required="" value="" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'password', 'error')} ">
	<label for="newpassword">
		<g:message code="company.newpassword.label" default="Nueva Contraseña" />
	</label><br />
	<g:passwordField name="password" value="" />
</div>
