import GMaps from 'gmaps';

const myLatLng = { lat: 0, lng: 0 };
const form = document.getElementById("form");
const address = document.getElementById("address");
form.addEventListener('submit', (event) => {
  event.preventDefault();
  event.target.insertAdjacentHTML("afterend",'<div id="map" class="circle"></div>')
  const URL = `https://maps.googleapis.com/maps/api/geocode/json?address=${address.value}`;
  fetch(URL).then(response => response.json()).then((data) => {
    myLatLng.lat = data.results[0].geometry.location.lat;
    myLatLng.lng = data.results[0].geometry.location.lng;
    const map = new GMaps({ el: '#map', lat: myLatLng.lat, lng: myLatLng.lng, zoom: 14 });
    const marker = { lat: myLatLng.lat, lng: myLatLng.lng };
    map.addMarkers([marker]);
  });
});
