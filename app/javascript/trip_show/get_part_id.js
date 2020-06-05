let part_id
document.querySelectorAll('.plus-sign').forEach(item => {
  console.log(item.attr('.data-part-id'));
  item.addEventListener('click', event => {
    console.log(document.querySelector('.activity_form').action);
    document.querySelector('.activity_form').action = `/parts/${item}/activities`
  })
})

