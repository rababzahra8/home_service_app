import Rails from "@rails/ujs";
import { Turbo } from "@hotwired/turbo-rails";

Rails.start();
Turbo.start();
import "controllers";

import "bootstrap/dist/js/bootstrap.bundle.min";
import "tiny-slider/dist/tiny-slider";
import "custom";
import { flashMsgInit } from "./src/flashMessages";
document.addEventListener("turbo:load", () => {
  flashMsgInit();
  const rejectionModal = new bootstrap.Modal(document.getElementById('rejectionModal'));
  document.body.addEventListener("click", (event) => {
    const rejectButton = event.target.closest(".btn-reject");
    if (rejectButton) {
      rejectionModal.show();
    }
  });
  var sidebar = document.getElementById('sidebar');

function sidebarToggle() {
    if (sidebar.style.display === "none") {
        sidebar.style.display = "block";
    } else {
        sidebar.style.display = "none";
    }
}

var profileDropdown = document.getElementById('ProfileDropDown');

function profileToggle() {
    if (profileDropdown.style.display === "none") {
        profileDropdown.style.display = "block";
    } else {
        profileDropdown.style.display = "none";
    }
}


/**
 * ### Modals ###
 */

function toggleModal(action, elem_trigger)
{
    elem_trigger.addEventListener('click', function () {
        if (action == 'add') {
            let modal_id = this.dataset.modal;
            document.getElementById(`${modal_id}`).classList.add('modal-is-open');
        } else {
            // Automaticlly get the opned modal ID
            let modal_id = elem_trigger.closest('.modal-wrapper').getAttribute('id');
            document.getElementById(`${modal_id}`).classList.remove('modal-is-open');
        }
    });
}


// Check if there is modals on the page
if (document.querySelector('.modal-wrapper'))
{
    // Open the modal
    document.querySelectorAll('.modal-trigger').forEach(btn => {
        toggleModal('add', btn);
    });
    
    // close the modal
    document.querySelectorAll('.close-modal').forEach(btn => {
        toggleModal('remove', btn);
    });
}

});
