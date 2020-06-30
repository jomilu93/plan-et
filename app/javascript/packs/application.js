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
require ("trip_show/autofill");


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
import { initModifyURLs } from '../trip_show/show_functionality'
import { initHideModal } from '../trip_show/show_functionality'
import { ajaxHomeScreen } from '../packs/home_screen'
import { autoFill } from '../trip_show/autofill'

Turbolinks.scroll = {};

document.addEventListener('turbolinks:load', () => {
  autoFill();
  initHideModal();
  initModifyURLs();
  ajaxHomeScreen();
  initMapbox();

  const elements = document.querySelectorAll("[data-turbolinks-scroll]");
  elements.forEach(function(element){

    element.addEventListener("click", ()=> {
      Turbolinks.scroll['top'] = document.scrollingElement.scrollTop;
    });

    element.addEventListener("submit", ()=> {
      Turbolinks.scroll['top'] = document.scrollingElement.scrollTop;
    });
  });

  if (Turbolinks.scroll['top']) {
    document.scrollingElement.scrollTo(0, Turbolinks.scroll['top']);
  }

  Turbolinks.scroll = {};
});

