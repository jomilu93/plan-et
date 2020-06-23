const ajaxHomeScreen = () => {

  document.querySelectorAll('#search_button').forEach(item => {
    item.addEventListener('click', () => {
      var search = document.querySelector('#search_bar').value;
      $(".trip-card-container").load(`/?search=${search} .trip-card-container`);
    });
  });
};

export {ajaxHomeScreen};



