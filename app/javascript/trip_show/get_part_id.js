let changeUrl = (id) => {
  document.querySelector('.activity_form').action = `/parts/${id}/activities`;
}

document.querySelectorAll('.plus-sign').forEach(item => {
  item.addEventListener('click', () => {
    changeUrl(item.getAttribute("data-part-id"));
  });
})
