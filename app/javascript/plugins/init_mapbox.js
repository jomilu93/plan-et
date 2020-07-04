import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  // const mapElement = document.getElementById('map');
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/jmlunamugica/ckc5r8mud0kyr1jovzaod4l6n'
  });
};

const addMarkersToMap = (map, markers) => {
  if (markers) {
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

      new mapboxgl.Marker({color: '#343a40'})
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });
  }
};

const fitMapToMarkers = (map, markers) => {
  if (markers) {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
  }
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    console.log("map zoom adjusted");
  }
  // $(`#map`).load(`${window.location.pathname} #map`);
};

if (document.querySelectorAll("#part_accordion")) {
  document.querySelectorAll("#part_accordion").forEach(part => {
    part.addEventListener('click', () => {
      var partId = part.getAttribute("data-part-id");
      window.history.pushState('', 'Show_Part', `${window.location.pathname}?part_id=${partId}`);
    });
  });
}

export { initMapbox };
