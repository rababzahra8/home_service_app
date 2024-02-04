import "@hotwired/turbo-rails"
import "controllers"
// application.js
import "@hotwired/stimulus";
import { flashMsgInit } from "./src/flashMessages";
document.addEventListener("turbo:load", () => {
  flashMsgInit();
  const rejectionModal = new bootstrap.Modal(
    document.getElementById("rejectionModal")
  );
  document.body.addEventListener("click", (event) => {
    const rejectButton = event.target.closest(".btn-reject");
    if (rejectButton) {
      rejectionModal.show();
    }
  });

  function toggleModal(action, elem_trigger) {
    elem_trigger.addEventListener("click", function () {
      if (action == "add") {
        let modal_id = this.dataset.modal;
        document.getElementById(`${modal_id}`).classList.add("modal-is-open");
      } else {
        // Automaticlly get the opned modal ID
        let modal_id = elem_trigger
          .closest(".modal-wrapper")
          .getAttribute("id");
        document
          .getElementById(`${modal_id}`)
          .classList.remove("modal-is-open");
      }
    });
  }
  if (document.querySelector(".modal-wrapper")) {
    document.querySelectorAll(".modal-trigger").forEach((btn) => {
      toggleModal("add", btn);
    });
    document.querySelectorAll(".close-modal").forEach((btn) => {
      toggleModal("remove", btn);
    });
  }
});
