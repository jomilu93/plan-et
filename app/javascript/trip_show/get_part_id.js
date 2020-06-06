// change the url to add the part ID the activity belongs to
let changeUrl = (id) => {
  document.querySelectorAll('.activity_form').forEach(form => {
    form.action = `/parts/${id}/activities`;
  });
}

// retireve part ID when clicking a '+' sign
document.querySelectorAll('.plus-sign').forEach(item => {
  item.addEventListener('click', () => {
    changeUrl(item.getAttribute("data-part-id"));
  });
});


// hide modal when submitting form
document.querySelectorAll('.submitActivity').forEach(btn => {
  btn.addEventListener('click', () => {
    $('#activityModal').modal('hide');
  });
});
