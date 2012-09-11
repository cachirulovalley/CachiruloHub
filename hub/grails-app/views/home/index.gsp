<html>
  <head>
    <meta name="layout" content="main">
    <title>Cachirulo Hub</title>
    <g:javascript library="jquery"/>
	  <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <g:javascript src="home.js"/>
  </head>
  <body>
  	<g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>

    <form id="searchForm" >
      <g:textField name="text" id="searchText"/>
      <input type="submit" value="Buscar!" >
    </form>

    <g:render template="tags"/>

    <table>
      <thead><tr><td>Nombre</td><td>Descripción</td></tr></thead>
      <tbody id="tableBody"/>
    </table>

    <div id="map_canvas" width="100%" heigth="400px"></div>

  </body>
</html>
