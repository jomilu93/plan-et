import { initMapbox } from '../plugins/init_mapbox';


document.getElementById("search_button").addEventListener("click", function(event){
  event.preventDefault()
});

initMapbox();

