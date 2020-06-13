// change the url to add the part ID the activity belongs to
console.log("JS loaded");

let changeUrl = (id, date) => {
  document.querySelectorAll('.activity_form').forEach(form => {
    form.action = `/parts/${id}/activities?date=${date}`;
  });
}

// retireve part ID when clicking a '+' sign
document.querySelectorAll('.plus-sign').forEach(item => {
  item.addEventListener('click', () => {
    console.log("click detected");
    changeUrl(item.getAttribute("data-part-id"), item.getAttribute("data-date"));
  });
});

// hide modal when submitting form
document.querySelectorAll('.submitActivity').forEach(btn => {
  btn.addEventListener('click', () => {
    $('#activityModal').modal('hide');
  });
});

// retrieve date from the '+' sign

