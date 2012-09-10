<html>
  <head>
    <meta name="layout" content="main">
    <title>Cachirulo Hub</title>
    <g:javascript library="jquery"/>
	  <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
  </head>
  <body>
  	<g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
  
    <g:textField name="text" id="searchText"/>
    <input type="button" value="Buscar!" onClick="fetchCompanies($('#searchText').val())" >

    <g:render template="tags"/>

    <table>
      <thead><tr><td>Nombre</td><td>Descripción</td></tr></thead>
      <tbody id="tableBody"/>
    </table>

    <div id="map_canvas" width="100%" heigth="400px"></div>


    <script>
      var map;
      var markersArray = [];
      var infoWindow = new google.maps.InfoWindow();

      function initialize() {
        var myLatlng = new google.maps.LatLng(41.6567,-0.8780);
        var mapOptions = {
          zoom: 7,
          center: myLatlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
      }

      function fetchCompanies(text) {
        $('#searchText').val(text);
        //With API HUB JSON get the TIC companies to refresh map
        $.getJSON('<g:createLink controller="home" action="queryJSON"/>', {format: "json", text: text}, function(data) { 
          updateList(data);
          updateMap(data);
          
        });
      }

      function updateList(data) {
        $("#tableBody").html("");

        //make new rows
        for (i in data) {
          var company = data[i]
          $("#tableBody").append("<tr><td><a href='/hub/company/show/" + company.id + "'>" + company.name + "</a></td><td>" + company.description + "</td></tr>");
        }
      }	

      function updateMap(data) {
        //clear markersArray
        for (i in markersArray) {
	  var item=markersArray[i];
	  if(item.idTimeout){
	    window.clearTimeout(item.idTimeout);
	  }else{
	    item.setMap(null);
	  }
        }
        markersArray.length = 0;

	var tooManyMarkers=!(data.length < 20);


        //make new markers
        for (var i = 0; i < data.length; i++) {
          var company = data[i]
          if(company.latitude!=null && company.longitude!=null){
            var location = new google.maps.LatLng(company.latitude, company.longitude);

	    var optionsMarker={position: location, map: map};

	    if(!tooManyMarkers){
	      optionsMarker['animation']=google.maps.Animation.DROP;
	      delete optionsMarker['map'];
	    }

            var marker = new google.maps.Marker(optionsMarker);
            marker.setTitle(company.name);
            attachClickEvent(marker, company);
            markersArray.push(marker);

	  //Si no hay demasiados pins lo animamos
	  if(!tooManyMarkers){
	    marker.idTimeout = window.setTimeout(function(marker) {
	      return function(){
		delete marker.idTimeout;
		marker.setMap(map);
	      }
	      }(marker), i * 200);
	      }
	  }
        }
      }

      function attachClickEvent(marker, company) {
        google.maps.event.addListener(marker, 'click', function() {
          infoWindow.content = "<b>" + company.name + "</b> <br>" + company.address
          infoWindow.open(map, marker);
        });

      }
      $(document).ready(function() {
        initialize();
        fetchCompanies();
      });
      
    </script>
  </body>
</html>
