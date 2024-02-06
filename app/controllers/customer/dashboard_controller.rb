# frozen_string_literal: true

module Customer
  class DashboardController < ApplicationController
    layout 'customer_dashboard'
    before_action :authenticate_user!

    def index
      @booked_services = current_user.bookings.includes(:service).map(&:service)
    end
  end
end
