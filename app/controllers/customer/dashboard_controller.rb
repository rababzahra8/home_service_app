# frozen_string_literal: true

module Customer
  class DashboardController < ApplicationController
    layout 'customer_dashboard'
    before_action :authenticate_user!

    def index
      @user = current_user
      @booked_services = current_user.bookings.includes(:service).map(&:service).count
    end
  end
end
