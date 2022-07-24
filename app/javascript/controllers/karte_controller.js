import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    markers: Array
  }

  connect() {
     // set the coordinates for the center of the map
     const mapcenter = [47.7, 11.5];
     // set the zoom on the map, higher number = higher zoom
     const zoom = 10;
     const map = L.map('map').setView([mapcenter[0], mapcenter[1]], zoom);

     const tiles = L.tileLayer('https://{s}.tile-cyclosm.openstreetmap.fr/cyclosm/{z}/{x}/{y}.png', {
       maxZoom: 20,
       attribution: '<a href="https://github.com/cyclosm/cyclosm-cartocss-style/releases" title="CyclOSM - Open Bicycle render">CyclOSM</a> | Map data: &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
     }).addTo(map);

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
    this.markersValue.forEach((marker) => {
      const mark = L.marker([marker.longitude, marker.latitude], {icon: alpinRadIcon}).addTo(map);
      mark.bindPopup(marker.name, marker.schedules).openPopup();
    })
  }
}
