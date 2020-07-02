require ("trip_show/autofill");
import { autoFill } from '../trip_show/autofill'



let changeActionPart = (id) => {
  document.querySelectorAll('.edit_part_form').forEach(form => {
    form.action = `/parts/${id}/`;
  });
}

let changeActionEditActivity = (actId) => {
  document.querySelectorAll('.activity_edit_form').forEach(form => {
    form.setAttribute("action", `/activities/${actId}/`);
  });
}

// change the url to add the part ID the activity belongs to
let changeActionActivity = (id, date) => {
  document.querySelectorAll('.activity_form').forEach(form => {
    form.action = `/parts/${id}/activities?date=${date}`;
  });
}

const initModifyURLs = () => {
  // retireve part ID when clicking a '+' sign
  document.querySelectorAll('.plus-sign').forEach(item => {
    var partId = item.getAttribute("data-part-id");
    item.addEventListener('click', () => {
      changeActionActivity(item.getAttribute("data-part-id"), item.getAttribute("data-date"));
      window.history.pushState('', 'Edit_Activity', `${window.location.pathname}?part_id=${partId}`);
    });
  });

  // retireve part ID when clicking a 'Edit Part' button
  document.querySelectorAll('#edit_part_button').forEach(item => {
    item.addEventListener('click', () => {
      $('#editPartModal').modal('hide');
      var partId = item.getAttribute("data-part-id");
      var tripId = item.getAttribute("data-trip-id");
      changeActionPart(item.getAttribute("data-part-id"));
      window.history.pushState('', 'Edit_Part', `${window.location.pathname}?part_id=${partId}`);
      $("#editPartModal .modal-content").load(`/trips/${tripId}?part_id=${partId} #editPartModal .modal-content`, autoFill)
      // following function is to ad the event listener for turbolinks behviour after the form is completelly loaded
      setTimeout(function () { // this is a supper shitty workaround but it will work for the demo. This should be refractored after that
        $('.simple_form.edit_part')[0].addEventListener("submit", () => {
          Turbolinks.scroll['top'] = document.scrollingElement.scrollTop;
        });
      }, 1500);
      $('#editPartModal').modal('show');
    });
  });

  // retireve activity ID when clicking a 'Edit Activity' link
  document.querySelectorAll('#edit_activity_link').forEach(item => {
    var partId = item.getAttribute("data-part-id");
    item.addEventListener('click', () => {
      $('#activityEditModal').modal('hide');
      var actId = item.getAttribute("data-act-id");
      var tripId = item.getAttribute("data-trip-id");
      window.history.pushState('', 'Edit_Activity', `${window.location.pathname}?part_id=${partId}`);
      $("#activityEditModal .modal-content").load(`/trips/${tripId}?activity_id=${actId} #activityEditModal .modal-content`, autoFill);
      // following function is to ad the event listener for turbolinks behviour after the form is completelly loaded
      setTimeout(function () { // this is a supper shitty workaround but it will work for the demo. This should be refractored after that
        $('.activity_edit_form')[0].addEventListener("submit", () => {
          Turbolinks.scroll['top'] = document.scrollingElement.scrollTop;
        });
      }, 1500);
      $('#activityEditModal').modal('show');
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

export {initHideModal, initModifyURLs};
