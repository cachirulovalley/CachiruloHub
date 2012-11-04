<g:each var="company" in="${companies}">
<li>
	<div class="empresa_item">
		<a href="${createLink(controller:'company', action:'show', id:company.id)}" onclick="return showCompany(${company.id})">
			<span class="img"><img class="thumbnail" src="${company.logo?createLink(controller:'company', action:'logo', id: company.id):resource(dir:'images', file:'avatar_default.jpg')}"/></span>
			<span> ${company.name}<h6>${company.web}</h6></span>
		</a>
	</div>
</li>
</g:each>