 
<%@ page import="hub.Company" %>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'email', 'error')}">
	<label for="email">
		<g:message code="company.email.label" default="Email" />
	</label>
	<g:field type="email" name="email" required="" value="${companyInstance?.email}" disabled="disabled"/>
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'oldpassword', 'error')} required">
	<label for="oldpassword">
		<g:message code="company.password.label" default="Contraseña" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="oldpassword" required="" value="" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="company.newemail.label" default="Nuevo Email" />
	</label>
	<g:field type="email" name="email" value="" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'password', 'error')} ">
	<label for="newpassword">
		<g:message code="company.newpassword.label" default="Nueva Contraseña" />
	</label>
	<g:passwordField name="password" value="" />
</div>
