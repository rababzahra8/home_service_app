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
});
