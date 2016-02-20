var marker;
function createMarker(coords, map, title){
  marker = new google.maps.Marker({
    position: coords,
    map: map,
    title: title
  });
}

var geocoding  = new google.maps.Geocoder();
$("#submit_button_geocoding").click(function(){
  codeAddress(geocoding);
});
$("#submit_button_reverse").click(function(){
  codeLatLng(geocoding);
});

function codeAddress(geocoding){
  var address = $("#search_box_geocoding").val();
  if(address.length > 0){
    geocoding.geocode({'address': address},function(results, status){
      if(status == google.maps.GeocoderStatus.OK){
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
      } else {
        alert("Geocode was not successful for the following reason: " + status);
      }
    });
  } else {
    alert("Search field can't be blank");
  }
}

function codeLatLng(geocoding) {
  var input = $('#search_box_reverse').val();
  console.log(input);

  var latlngbounds = new google.maps.LatLngBounds();
  var listener;
  var regex = /([1-9])+\.([1-9])+\,([1-9])+\.([1-9])+/g;
  if(regex.test(input)) {
    var latLngStr = input.split(",",2);
    var lat = parseFloat(latLngStr[0]);
    var lng = parseFloat(latLngStr[1]);
    var latLng = new google.maps.LatLng(lat, lng);
    geocoding.geocode({'latLng': latLng}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if(results.length > 0) {
          //map.setZoom(11);
          var marker;
          map.setCenter(results[1].geometry.location);
          var i;
          info = createInfoWindow("");
          for(i in results){
            latlngbounds.extend(results[i].geometry.location);
              marker = new google.maps.Marker({
              map: map,
              position: results[i].geometry.location
            });

            google.maps.event.addListener(marker, 'click', (function(marker,i) {
              return function() {
                info.setContent(results[i].formatted_address);
                info.open(map,marker);
              }
            })(marker,i));
          }

          map.fitBounds(latlngbounds);
          listener = google.maps.event.addListener(map, "idle", function() {
            if (map.getZoom() > 16) map.setZoom(16);
            google.maps.event.removeListener(listener);
          });
        }
      } else {
        alert("Geocoder failed due to: " + status);
      }
    });
  } else {
    alert("Wrong lat,lng format!");
  }
}