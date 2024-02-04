// app/javascript/controllers/category_filter_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["servicesContainer"];

  connect() {
    console.log("Stimulus controller connected");
  }

  filter(event) {
    const categoryId = event.currentTarget.dataset.categoryId;

    fetch(`/home/all_services?category=${categoryId}`, { headers: { accept: "text/vnd.turbo-stream.html" } })
      .then(response => response.text())
      .then(data => {
        this.servicesContainerTarget.innerHTML = data;
      });
  }
}