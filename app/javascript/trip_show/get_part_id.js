let changeUrl = (id) => {
  document.querySelectorAll('.activity_form').forEach(form => {
    form.action = `/parts/${id}/activities`;
  });
}

document.querySelectorAll('.plus-sign').forEach(item => {
  item.addEventListener('click', () => {
    changeUrl(item.getAttribute("data-part-id"));
  });
});



document.querySelectorAll('.submitActivity').forEach(btn => {
  btn.addEventListener('click', () => {
    $('#activityModal').modal('hide');
  });
});
