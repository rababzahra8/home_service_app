// app/javascript/controllers/rating_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  pendingReviews() {
    document.getElementById("pending_reviews").style.display = "block";
    document.getElementById("my_reviews").style.display = "none";
  }

  reviewed() {
    document.getElementById("pending_reviews").style.display = "none";
    document.getElementById("my_reviews").style.display = "block";
  }
}
