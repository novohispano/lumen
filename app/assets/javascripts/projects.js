$(document).ready(renderMap)
$(document).on('page:load', renderMap)

function renderMap() {
  var mapOptions = {
    center: { lat: 6.75, lng: -66.58973},
    zoom: 6,
    scrollwheel: false
  };

  var map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  fetchProjects(map);
}

function fetchProjects(map) {
  $.ajax({
    url: 'http://localhost:3000/api/v1/projects.json',
    success: function(projects) {
      $.each(projects, function(index, project) {
        var latLng = new google.maps.LatLng(project.latitude, project.longitude);
        var marker = new google.maps.Marker({
          position: latLng,
          title:    project.name
        });

        renderMarker(marker, map);
      })
    }
  })
}

function renderMarker(marker, map) {
  marker.setMap(map);
}
