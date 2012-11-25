 
<%@ page import="hub.Company" %>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="hub.template.profile.email" default="Email" />
		<span class="required-indicator">*</span> :
	</label><br />
	<g:field type="email" name="email" value="${companyInstance?.email}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'oldpassword', 'error')} required">
	<label for="oldpassword">
		<g:message code="hub.template.profile.password.current" default="Current password" />
		<span class="required-indicator">*</span> :
	</label><br />
	<g:passwordField name="oldpassword" required="" value="" />
</div>

<div class="fieldcontain ${hasErrors(bean: companyInstance, field: 'password', 'error')} ">
	<label for="newpassword">
		<g:message code="hub.template.profile.password.new" default="New password" />
	</label><br />
	<g:passwordField name="password" value="" />
</div>
