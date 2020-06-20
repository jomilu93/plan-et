// change the url to add the part ID the activity belongs to
let changeActionActivity = (id, date) => {
  document.querySelectorAll('.activity_form').forEach(form => {
    form.action = `/parts/${id}/activities?date=${date}`;
  });
}

let changeActionPart = (id) => {
  document.querySelectorAll('.edit_part_form').forEach(form => {
    form.action = `/parts/${id}/`;
    console.log("Action changed!");
  });
}

let changeURLPart = (id) => {
  document.querySelectorAll('#edit_part_button').forEach(item => {
    window.history.pushState('', 'Edit_Part', `${window.location.pathname}?part_id=${id}`);
  });
  console.log("URL Changed");
}

const initModifyActionURL = () => {
  // retireve part ID when clicking a '+' sign
  document.querySelectorAll('.plus-sign').forEach(item => {
    item.addEventListener('click', () => {
      console.log("click detected");
      changeActionActivity(item.getAttribute("data-part-id"), item.getAttribute("data-date"));
      console.log(item.getAttribute("data-part-id"));
    });
  });
  // retireve part ID when clicking a 'Edit Part' button
  document.querySelectorAll('#edit_part_button').forEach(item => {
    item.addEventListener('click', () => {
      $('#editPartModal').modal('hide');
      console.log("edit part request detected");
      var part_id = item.getAttribute("data-part-id");
      var trip_id = item.getAttribute("data-trip-id");
      changeActionPart(item.getAttribute("data-part-id"));
      changeURLPart(item.getAttribute("data-part-id"));
      console.log(item.getAttribute("data-part-id"));
      $("#editPartModal .modal-content").load(`/trips/${trip_id}?part_id=${part_id} #editPartModal .modal-content`)
      $('#editPartModal').modal('show');
    });
  });
};


const initHideModal =() => {
  // hide modal when submitting activity form
  document.querySelectorAll('.submitActivity').forEach(btn => {
    btn.addEventListener('click', () => {
      $('#activityModal').modal('hide');
    });
  });
  // hide modal when submitting part form
  document.querySelectorAll('#submit_part_edits').forEach(btn => {
    btn.addEventListener('click', () => {
      $('#editPartModal').modal('hide');
    });
  });
};


export {initHideModal, initModifyActionURL};

