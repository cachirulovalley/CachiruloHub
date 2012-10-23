<html>
  <head>
    <meta name="layout" content="public">
    <title>Cachirulo Hub</title>
	  <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <g:javascript src="home.js"/>
    <g:javascript src="markerclusterer.js" />
  </head>
  <body>
      <div class="map" id="map_canvas"></div>
      <div class="panel" id="panel"> 
        <div class="panelContent" id="panelContent"> </div>
        <a href="#" onClick="$('#panel').hide();" class="close"><g:message code="hub.home.close"/></a>
      </div>
  </body>
</html>
