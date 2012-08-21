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
  
    <g:formRemote name="searchForm" update="companyList" url="[controller: 'home', action:'query']" onLoading="initialize(\$('#text').val())">
      Buscar empresas: <g:textField name="text"/>
      <br/>
      <input type="submit" value="Buscar!">
    </g:formRemote>
    <div id="companyList"></div>

	<div id="map_canvas" width="100%" heigth="400px"></div>
	
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	    <script>
	      function initialize(text) {
		      //With API HUB JSON get the TIC companies to refresh map
		      $.getJSON('<g:createLink controller="home" action="queryJSON"/>', {format: "json", text: text}, function(data) { 
		
		        for (var i = 0; i < data.length; i++) {
				if(data[i].latitude!=null && data[i].longitude!=null){
		          var location = new google.maps.LatLng(data[i].latitude, data[i].longitude);
		          var marker = new google.maps.Marker({
		              position: location, 
		              map: map
		          });
		          var j = i + 1;
		          //marker.setTitle(j.toString());
		          marker.setTitle(data[i].name);
		          attachClickEvent(marker, i, data);
				}
		        }
		      });

	      	var myLatlng = new google.maps.LatLng(41.6567,-0.8780);
	        var mapOptions = {
	          zoom: 7,
	          center: myLatlng,
	          mapTypeId: google.maps.MapTypeId.ROADMAP
	        }
	        var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
	
	      	


	        function attachClickEvent(marker, number, data) {
	          var infowindow = new google.maps.InfoWindow(
	              { content: "<b>" + data[number].name+"</b> <br>"+data[number].address
});
	          google.maps.event.addListener(marker, 'click', function() {
	            infowindow.open(map,marker);
	          });

	        }




	      }
	initialize()
	    </script>
  </body>
</html>
