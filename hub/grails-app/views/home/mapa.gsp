<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
  html { height: 100% }
  body { height: 100%; margin: 0px; padding: 0px }
  #map_canvas { height: 100% }
</style>
<script src="http://localhost:8080/hub/static/plugins/jquery-1.7.2/js/jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript"
    src="https://maps.google.com/maps/api/js?sensor=false&language=es&region=ES">
</script>
<script type="text/javascript">
  function initialize() {
    var myLatlng = new google.maps.LatLng(41.688297,-0.883232);
    var myOptions = {
      zoom: 2,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
        myOptions);

    var infowindow = new google.maps.InfoWindow();

    $.getJSON('http://localhost:8080/hub/home/queryJSON',{text:''}
      ).done(function(data) { 
	  
	var markers=[];

	$.each(data,function(index, item){
	    var marker = new google.maps.Marker({
	      position: new google.maps.LatLng(item.latitude,item.longitude),
	      title: item.name,
	      animation: google.maps.Animation.DROP
	    });
	    
	    markers.push(marker);

	    item.description=item.description?item.description:'Prueba';
	    if(item.description){
	    google.maps.event.addListener(marker, 'click', function(event) {
	      infowindow.setContent(item.description);
	      infowindow.open(map, marker);
	    });
	    }

	   setTimeout(function(marker) {
	    return function(){
	      marker.setMap(map);
	    }
	  }(marker), index * 200);

	 });


      });
  }
 
</script>
</head>
<body onload="initialize()">
  <div id="map_canvas" style="width:100%; height:100%"></div>
</body>
</html>