
var map;
var markers = {};
var infoWindow = new google.maps.InfoWindow();

function initMap() {
  var myLatlng = new google.maps.LatLng(41.6567,-0.8780);
  var mapOptions = {
    zoom: 8,
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
  $.each(data,function(index,company){
    $("#tableBody").append("<li><div class='empresa_item'><span class='img'><img class='thumbnail' src='company/logo/" + company.id + "'/></span><span><a href='company/show/" + company.id + "'>" + company.name + "</a></span></div></li>");
  });
}	

function updateMap(data) {
  //clear markers
  $.each(markers,function(index,item){
    item.setMap(null);
  });
  markers={};
  //make new markers
 $.each(data,function(index,company){
      if(company.latitude==null || company.longitude==null
      //Temporal: hasta que los datos sean correctos
      || company.latitude==1 || company.longitude==1
      ){
	return true; /*continue;*/
      }
    
      var marker = markers[company.positionId]
      if(marker){
          marker.companies.push(company)
	  return true; /*continue;*/
      }
      
      var location = new google.maps.LatLng(company.latitude, company.longitude);
      marker = new google.maps.Marker({position: location, map: map});
      marker.setTitle(company.name);
      marker.companies = [company]
      markers[company.positionId] = marker;              
      attachClickEvent(marker);
    
  });
}

function attachClickEvent(marker) {
  google.maps.event.addListener(marker, 'click', function() {
    infoWindow.content = ""
    $.each(marker.companies,function(index,company){
        var company = marker.companies[index]
        infoWindow.content += "<b><a href='company/show/" + company.id + "'>" + company.name + "</a></b> <br>"
    });
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

