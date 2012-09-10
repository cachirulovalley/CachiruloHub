 <div>
<h2>Some Tags</h2>
<g:each in="${tags}" var="tag">
  <a href="#" onclick="fetchCompanies('${tag.name}')">${tag.name} (${tag.numberOfOccurrences})</a>
</g:each>
 </div>
