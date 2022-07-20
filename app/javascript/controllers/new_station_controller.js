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
    let marker = undefined;
    const formLat = document.getElementById('station_latitude');
    const formLon = document.getElementById('station_longitude');

    // Marker config
    const alpinRadIcon = L.icon({
      iconUrl: 'https://res.cloudinary.com/julwicr/image/upload/v1655480037/production/pin_c6jotw.svg',
      shadowUrl: 'https://res.cloudinary.com/julwicr/image/upload/v1655533244/production/pin_shadow_hdaqsz.svg',

      iconSize: [38, 95], // size of the icon
      shadowSize:   [64, 64], // size of the shadow
      iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
      shadowAnchor: [35, 78],  // the same for the shadow
      popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
    })

    map.on('click', (e) => {
      if (marker != undefined) {
        map.removeLayer(marker);
      };

      const coord = e.latlng;
      lat = coord.lat;
      lon = coord.lng;

      formLat.value = lat;
      formLon.value = lon;

      marker = L.marker([lat, lon], {icon: alpinRadIcon}).addTo(map);
      // marker.bindPopup().openPopup();
      console.log(lat, lon);
    });


  }
}
