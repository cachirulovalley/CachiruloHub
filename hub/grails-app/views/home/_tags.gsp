<ul class="tagcloud">
<g:each in="${tags}" var="tag">
  <li><a href="#" onclick="fetchCompanies('${tag.name}')">${tag.name} (${tag.numberOfOccurrences})</a></li>
</g:each>
</ul>