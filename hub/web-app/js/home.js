
var map;
var markersArray = [];
var infoWindow = new google.maps.InfoWindow();

function initMap() {
  var myLatlng = new google.maps.LatLng(41.6567,-0.8780);
  var mapOptions = {
    zoom: 7,
    center: myLatlng,
    disableDefaultUI: true,
    zoomControl:true,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
}

function fetchCompanies(text) {
  $('#searchText').val(text);
  //With API HUB JSON get the TIC companies to refresh map
  $.getJSON('home/queryJSON', {format: "json", text: text}, function(data) { 
    updateList(data);
    updateMap(data);
  });
}

function updateList(data) {
  $('#tableBody').html("");

  //make new rows
  for (i in data) {
    var company = data[i]
    $("#tableBody").append("<li><a href='company/show/" + company.id + "'>" + company.name + "</a></li>");
  }
}	

function updateMap(data) {
  //clear markersArray
  for (i in markersArray) {
    var item=markersArray[i];
    if(item.idTimeout){
      window.clearTimeout(item.idTimeout);
    }
    else{
      item.setMap(null);
    }
  }
  markersArray.length = 0;

  var tooManyMarkers=!(data.length < 20);
  var latlngbounds = new google.maps.LatLngBounds( );

  //make new markers
  for (var i = 0; i < data.length; i++) {
    var company = data[i]
    if(company.latitude!=null && company.longitude!=null
    //Temporal: hasta que los datos sean correctos
    && company.latitude!=1 && company.longitude!=1
    ){
      var location = new google.maps.LatLng(company.latitude, company.longitude);

      latlngbounds.extend( location );

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
  map.fitBounds( latlngbounds );
}

function attachClickEvent(marker, company) {
  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.content = "<b>" + company.name + "</b> <br>" + company.address
    infoWindow.open(map, marker);
  });

}

$(document).ready(function() {

  $('#searchForm').submit(function() {
    fetchCompanies($('#searchText').val());
    return false;
  });
  initMap();
  fetchCompanies();
});

