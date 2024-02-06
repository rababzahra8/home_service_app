// app/javascript/controllers/booking_controller.js

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  showAllBookings() {
    document.getElementById("allBookings").style.display = "block";
    document.getElementById("bookingRequests").style.display = "none";
    document.getElementById("rejectedBookings").style.display = "none";
    document.getElementById("reapprovalRequests").style.display = "none";
  }

  showBookingRequests() {
    document.getElementById("allBookings").style.display = "none";
    document.getElementById("rejectedBookings").style.display = "none";
    document.getElementById("reapprovalRequests").style.display = "none";

    document.getElementById("bookingRequests").style.display = "block";
  }
  showRejectedBookings() {
    document.getElementById("rejectedBookings").style.display = "block";
    document.getElementById("allBookings").style.display = "none";
    document.getElementById("bookingRequests").style.display = "none";
    document.getElementById("reapprovalRequests").style.display = "none";
  }
  showReapprovalRequests() {
    document.getElementById("rejectedBookings").style.display = "none";
    document.getElementById("allBookings").style.display = "none";
    document.getElementById("bookingRequests").style.display = "none";
    document.getElementById("reapprovalRequests").style.display = "block";
  }
}
