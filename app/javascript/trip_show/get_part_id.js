
let changeUrl = (id) => {
  console.log(id);
  document.querySelector('.activity_form').action = `/parts/${id}/activities`;
}

document.querySelectorAll('.plus-sign').forEach(item => {
  console.log(item.getAttribute("data-part-id"));
  item.addEventListener('click', () => {
    changeUrl(item.getAttribute("data-part-id"));
  });
})
