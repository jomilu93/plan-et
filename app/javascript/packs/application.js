// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require('jquery');
require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

require ("trip_show/show_functionality");

//require date_wrapper


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// Internal imports, e.g:
import { initMapbox } from '../plugins/init_mapbox';
// import { initSelect2 } from '../components/init_select2';
import { initModifyActionURL } from '../trip_show/show_functionality'
import { initHideModal } from '../trip_show/show_functionality'
import { getSearchValue } from '../packs/home_screen'

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initHideModal();
  initModifyActionURL();
  getSearchValue();
});

