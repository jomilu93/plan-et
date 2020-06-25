// retireve part ID when clicking a 'Edit Part' button
document.querySelectorAll('#edit_part_button').forEach(item => {
  item.addEventListener('click', () => {
    $('#editPartModal').modal('hide');
    var partId = item.getAttribute("data-part-id");
    var tripId = item.getAttribute("data-trip-id");
    changeActionPart(item.getAttribute("data-part-id"));
    window.history.pushState('', 'Edit_Part', `${window.location.pathname}?part_id=${partId}`);
    $("#editPartModal .modal-content").load(`/trips/${tripId}?part_id=${partId} #editPartModal .modal-content`)
    $('#editPartModal').modal('show');
  });
});

// retireve activity ID when clicking a 'Edit Activity' link
document.querySelectorAll('#edit_activity_link').forEach(item => {
  item.addEventListener('click', () => {
    $('#activityEditModal').modal('hide');
    var actId = item.getAttribute("data-act-id");
    var tripId = item.getAttribute("data-trip-id");
    $("#activityEditModal .modal-content").load(`/trips/${tripId}?activity_id=${actId} #activityEditModal .modal-content`)
    window.history.pushState('', 'Edit Activity', `${window.location.pathname}?activity_id=${actId}`); 
    changeActionEditActivity(actId);
    //$('#activityEditModal').modal('show');
    let form = document.querySelector('.activity_edit_form');
    console.log(form); // en este console log el action aparece como queremos que aparezca
  });
});

let changeActionPart = (id) => {
  document.querySelectorAll('.edit_part_form').forEach(form => {
    form.action = `/parts/${id}/`;
  });
}

let changeActionEditActivity = (actId) => {
  document.querySelectorAll('.activity_edit_form').forEach(form => {
    form.action = `/activities/${actId}/`;
  });
}

// change the url to add the part ID the activity belongs to
let changeActionActivity = (id, date) => {
  document.querySelectorAll('.activity_form').forEach(form => {
    form.action = `/parts/${id}/activities?date=${date}`;
  });
}

const initModifyActionURL = () => {
  // retireve part ID when clicking a '+' sign
  document.querySelectorAll('.plus-sign').forEach(item => {
    item.addEventListener('click', () => {
      changeActionActivity(item.getAttribute("data-part-id"), item.getAttribute("data-date"));
    });
  });
}

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
