const autoFill = () => {

  const query = document.querySelector("#part_city");
  const results = document.querySelector('.results');

  const drawResponseList = (data) => {
    results.innerHTML = '';
    data.forEach((city) => {
      results.insertAdjacentHTML('beforeend', `<p>${city.name}</p>`);
    });
  };

  const autocomplete = (e) => {
    results.innerHTML = '';
    fetch(`http://localhost:3000/api/v1/cities/?query=${query.value}`)
      .then(response => response.json())
      .then(data => drawResponseList(data));
  };

  query.addEventListener('keyup', autocomplete);

  };

export {autoFill};
