<h3><g:message code="hub.template.tags.tags"/></h3>
<ul>
<g:each in="${tags}" var="tag">
  <li><a href="#" onclick="fetchCompanies('${tag.name}')">${tag.name} (${tag.numberOfOccurrences})</a></li>
</g:each>
</ul>