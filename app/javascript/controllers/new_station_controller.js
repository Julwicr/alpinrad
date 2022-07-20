import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-station"
export default class extends Controller {

  connect() {
    // set the coordinates for the center of the map
    const mapcenter = [47.7, 11.5];
    // set the zoom on the map, higher number = higher zoom
    const zoom = 12;
    const map = L.map('new-station-map').setView([mapcenter[0], mapcenter[1]], zoom);

    const tiles = L.tileLayer('https://{s}.tile-cyclosm.openstreetmap.fr/cyclosm/{z}/{x}/{y}.png', {
      maxZoom: 20,
      attribution: '<a href="https://github.com/cyclosm/cyclosm-cartocss-style/releases" title="CyclOSM - Open Bicycle render">CyclOSM</a> | Map data: &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    let lat;
    let lon;
    const formLat = document.getElementById('station_latitude');
    const formLon = document.getElementById('station_longitude');

    map.on('click', function(e){
      const coord = e.latlng;
      lat = coord.lat;
      lon = coord.lng;
      console.log(lat, lon);
      formLat.value = lat;
      formLon.value = lon;
    });


  }
}
