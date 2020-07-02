const ajaxHomeScreen = () => {

  document.querySelectorAll('#search_button').forEach(item => {
    item.addEventListener('click', () => {
      var search = document.querySelector('#search_bar').value;
      $(".trip-card-container").load(`/?search=${search} .trip-card-container`);
    });
  });
};

const sloganEffect =() => {
  var textWrapper = document.querySelector('.ml2');
  textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

  anime.timeline()
    .add({
      targets: '.ml2 .letter',
      scale: [4,1],
      opacity: [0,1],
      translateZ: 0,
      easing: "easeOutExpo",
      duration: 950,
      delay: (el, i) => 70*i
    });
};

export {ajaxHomeScreen, sloganEffect};



