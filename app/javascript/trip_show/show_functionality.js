// change the url to add the part ID the activity belongs to
let changeUrlActivity = (id, date) => {
  document.querySelectorAll('.activity_form').forEach(form => {
    form.action = `/parts/${id}/activities?date=${date}`;
  });
}

let changeUrlPart = (id) => {
  document.querySelectorAll('.edit_part_form').forEach(form => {
    form.action = `/parts/${id}/`;
  });
}

const initModifyURL = () => {
  // retireve part ID when clicking a '+' sign
  document.querySelectorAll('.plus-sign').forEach(item => {
    item.addEventListener('click', () => {
      console.log("click detected");
      changeUrlActivity(item.getAttribute("data-part-id"), item.getAttribute("data-date"));
    });
  });
  document.querySelectorAll('#edit_part_button').forEach(item => {
    item.addEventListener('click', () => {
      console.log("edit part request detected");
      changeUrlPart(item.getAttribute("data-part-id"));
    });
  });
};


const initHideModal =() => {
  // hide modal when submitting form
  document.querySelectorAll('.submitActivity').forEach(btn => {
    btn.addEventListener('click', () => {
      $('#activityModal').modal('hide');
    });
  document.querySelectorAll('#submit_part_edits').forEach(btn => {
    btn.addEventListener('click', () => {
      $('#editPartModal').modal('hide');
    });
  });
};

export {initHideModal, initModifyURL};

