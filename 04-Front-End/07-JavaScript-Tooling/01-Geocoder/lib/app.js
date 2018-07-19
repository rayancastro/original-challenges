import GMaps from 'gmaps';

let rand5;
let rand6;
let rand7;
function mapShape() {
  const choice = document.getElementsByName('shape');
  const maps = document.getElementById('map');
  if (choice[1].checked) {
    maps.classList.add("circle");
  } else if (choice[2].checked) {
    rand5 = Math.random() * 100;
    rand6 = (Math.random() * 40) + 20;
    rand7 = (Math.random() * 40) + 20;
    const mistery = `width: ${rand6}vw; height: ${rand7}vh; border-radius: ${rand5}%;`;
    maps.setAttribute("style", mistery);
  }
}

const myLatLng = { lat: 0, lng: 0 };
const form = document.getElementById("form");
const address = document.getElementById("address");
form.addEventListener('submit', (event) => {
  event.preventDefault();
  const element = document.getElementById("map");
  if (element) {
    element.parentNode.removeChild(element);
  }
  event.target.insertAdjacentHTML("afterend", '<div id="map"></div>');
  mapShape();
  const URL = `https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyDHelnesgQsVypZq4wi-4kht0El9sSxOak&address=${address.value}`;
  fetch(URL).then(response => response.json()).then((data) => {
    myLatLng.lat = data.results[0].geometry.location.lat;
    myLatLng.lng = data.results[0].geometry.location.lng;
    const map = new GMaps({ el: '#map', lat: myLatLng.lat, lng: myLatLng.lng, zoom: 16 });
    const marker = { lat: myLatLng.lat, lng: myLatLng.lng };
    map.addMarkers([marker]);
  });
});
