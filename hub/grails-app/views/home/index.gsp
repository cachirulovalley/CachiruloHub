<html>
  <head>
    <meta name="layout" content="main">
    <title>Cachirulo Hub</title>
    <g:javascript library="jquery"/>
  </head>
  <body>
  	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
  
    <g:formRemote name="searchForm" update="companyList" url="[controller: 'home', action:'query']">
      Buscar empresas: <g:textField name="text"/>
      <br/>
      <input type="submit" value="Buscar!">
    </g:formRemote>
    <div id="companyList"></div>
  </body>
</html>
