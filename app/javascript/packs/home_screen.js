let getSearchValue = () => {
  var search = $('#search-bar').getAttribute("value");
  console.log(search);
}


// const ajaxSearchResults = () => {
//   // load search results without reloading page
//   document.querySelectorAll('.searchButton').forEach(item => {
//     item.addEventListener('click', () => {
//       console.log("search initiated");
//     });
//   });

// }

export {getSearchValue};



