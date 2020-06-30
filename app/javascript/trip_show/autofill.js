const autoFill = () => {

  const query = document.querySelector("#part_city");
  const results = document.querySelector('.results');

  const drawResponseList = (data) => {
    results.innerHTML = '';
    data.forEach((city) => {
      results.insertAdjacentHTML('beforeend', `<p class="result_item">${city.name}</p>`);
    });
    document.querySelectorAll(".result_item").forEach(item => {
      item.addEventListener('click', () => {
          console.log("click detected");
          query.value = item.innerHTML;
          results.innerHTML = '';
      });
    });
  };

  const autocomplete = (e) => {
    if (query.value){
      console.log(query.value);
      results.innerHTML = '';
      fetch(`/api/v1/cities/?query=${query.value}`)
        .then(response => response.json())
        .then(data => drawResponseList(data));

    } else {
      results.innerHTML = '';
    }

  };

  query.addEventListener('keyup', autocomplete);

};

export {autoFill};
