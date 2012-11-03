<g:each var="company" in="${companies}">
<li>
	<div class="empresa_item">
		<span class="img"><img class="thumbnail" src="${company.logo?createLink(controller:'company', action:'logo', id: company.id):resource(dir:'images', file:'avatar_default.jpg')}"/></span>
		<span><a href="${createLink(controller:'company', action:'show', id:company.id)}" onclick="return showCompany(${company.id})"> ${company.name}</a><h6>${company.web}</h6></span></div>
</li>
</g:each>