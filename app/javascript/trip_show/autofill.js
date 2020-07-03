const autoFill = () => {

  document.querySelectorAll(".autocomplete").forEach(autocomplete => {
    var query = autocomplete.querySelector("div input");
    var results = autocomplete.querySelector(".results");
    console.log(autocomplete);
    console.log(query.value);

    const drawResponseList = (data) => {
      results.innerHTML = '';
      data.forEach((item) => {
        results.insertAdjacentHTML('beforeend', `<p class="result_item" title="${item.address}">${item.name}</p>`);
      });
      autocomplete.querySelectorAll("p.result_item").forEach(result => {
        result.addEventListener('click', () => {
            console.log("click detected");
            query.value = result.innerHTML;
            if (autocomplete.id = "restaurants") {
              document.querySelector("#restaurant_address").value = result.title;
            }

            if (autocomplete.id = "hotels") {
              document.querySelector("#hotel_address").value = result.title;
            }
            results.innerHTML = '';
        });
      });
    };

    const callAPI = () => {

      var part_id = new RegExp('[\?&]' + "part_id" + '=([^&#]*)').exec(window.location.href);
      if (query.value){
        console.log(query.value);
        results.innerHTML = '';
        fetch(`/api/v1/${autocomplete.id}/?query=${query.value}&part_id=${part_id[1]}`)
          .then(response => response.json())
          .then(data => drawResponseList(data));

      } else {
        results.innerHTML = '';
      }
    };

    query.addEventListener('keyup', callAPI);

  });

};

export {autoFill};
