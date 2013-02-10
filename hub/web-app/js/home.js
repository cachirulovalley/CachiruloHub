
var map;
var mc;
var markersArray=[];
var infoWindow = new google.maps.InfoWindow();

var baseUrl

function supports_history_api() {
  return !!(window.history && history.pushState);
}

function initMap() {
  map_canvas = $("#map_canvas").get(0);
  if(map_canvas){
    var myLatlng = new google.maps.LatLng(41.6567,-0.8780);
    var mapOptions = {
      zoom: 8,
      center: myLatlng,
      disableDefaultUI: true,
      zoomControl:true,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    
    if(!map){
      map = new google.maps.Map(map_canvas  , mapOptions);
    }
    var layer = new google.maps.FusionTablesLayer({
    query: {
      select: 'json_4326',
      from: '1vRgso0NNIocWUXffTPM1ukqAS0H3L4a60aWq6g',
      where: "name_1 not equal to 'Aragón'"
    },styles: [{


      polygonOptions: {
        fillColor: '#eaeaea',
        visible: false
      }
    }]
    });
    //layer.setMap(map);
    if(!mc){
      var mcOptions = {
        gridSize: 25, 
        maxZoom: 12, 
        styles: [{
          opt_textColor: 'white',
          height: 78,
          url: "http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/images/m4.png",
          width: 78
          }]
      };
    mc = new MarkerClusterer(map, [], mcOptions);
    }
    google.maps.event.addListener(map, 'click',
      function(){
        infoWindow.close();
      });
  }
}

function fetchCompanies(text) {
  $('#searchText').val(text);
  //With API HUB JSON get the TIC companies to refresh map
  $.getJSON(baseUrl + 'home/queryJSON', {format: "json", text: text}, function(data) { 
    updateList(data);
    updateMap(data);
  });
}

function updateList(data) {
  $('#tableBody').html("");

  //make new rows
  $.each(data,function(index,company){
    $("#tableBody").append("<li><div class='empresa_item'><a href='"+baseUrl+"company/show/" + company.id + "' onclick='return showCompany(" + company.id + ")'><span class='img'><img class='thumbnail' src='"+ company.logoSrc + "'/></span><span>" + company.name + "<h6>"+company.web+"</h6></span></a></div></li>");
  });
}	

function updateMap(data) {
  //clear markers
  //$.each(markers,function(index,item){
  //  item.setMap(null);
  //});
  map_canvas = $("#map_canvas").get(0);
  if(map_canvas){
    mc.clearMarkers();
    markersArray=[];
    //make new markers
    var markers={};
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
        marker = new google.maps.Marker({position: location});
        marker.setTitle(company.name);
        marker.companies = [company];
        
        markers[company.positionId] = marker;
        markersArray.push(marker);
        attachClickEvent(marker);
    });
    mc.addMarkers(markersArray);
  }
}

function attachClickEvent(marker) {
  google.maps.event.addListener(marker, 'click', function() {
    var content = ""
    $.each(marker.companies,function(index,company){
        var company = marker.companies[index]
        content += "<b><a onclick='return showCompany(" + company.id + ")' href='"+ baseUrl +"company/show/" + company.id + "'>" + company.name + "</a></b> <br>"
    });
    infoWindow.setContent(content)
    infoWindow.open(map, marker);
  });

}


function showCompany(id, ignoreState) {
  var url = baseUrl + 'company/show/' + id;
  $.ajax({
    url: url,
    success:function(data,textStatus) {
      $('#panelContent').html(data);
      showPanel(true);
      if(supports_history_api() && !ignoreState){
            history.pushState(id, null, url);
      }
    },
    error:function(XMLHttpRequest,textStatus,errorThrown){}
  });
  return false;
}

function showPanel(big) {
  if (big) {
    $('#panel').css({ height: "100%", width: "100%" });
    $('#map_container').hide();
  }
  else {
    $('#panel').css({ height: "", width: ""});
    $('#panel').addClass('lightbox');
  }
    $('#panel').show();
}

function hidePanel(ignoreState) {
      $('#panel').css({ height: "", width: ""});
      $('#panel').hide();
      $('#panel').removeClass('lightbox');
      $('#map_container').show();
      if(supports_history_api() && !ignoreState){
            history.pushState(null, null, baseUrl);
      }
}

$(document).ready(function() {
  baseUrl = $('#baseUrl').val();
  $('#panel').hide();
  $('#searchForm').submit(function() {
    fetchCompanies($('#searchText').val());
    return false;
  });
  
  // Capturamos el evento popstate para mostrar la compañia que hay en la url guardada en el history cuando nos movemos por este.
  $(window).bind("popstate", function(e) {
      var companyId = event.state;
      if(companyId) {
          showCompany(companyId, true);
      } else {
          hidePanel(true);
      }
  });

  initMap();
  fetchCompanies();
});

