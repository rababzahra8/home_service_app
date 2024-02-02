// app/javascript/controllers/booking_controller.js

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  showAllBookings() {
    document.getElementById("allBookings").style.display = "block";
    document.getElementById("bookingRequests").style.display = "none";
    document.getElementById("completedBookings").style.display = "none";
  }

  showBookingRequests() {
    document.getElementById("allBookings").style.display = "none";
    document.getElementById("completedBookings").style.display = "none";
    document.getElementById("bookingRequests").style.display = "block";
  }
  showCompletedBookings() {
    document.getElementById("allBookings").style.display = "none";
    document.getElementById("bookingRequests").style.display = "none";
    document.getElementById("completedBookings").style.display = "block";
  }
}
