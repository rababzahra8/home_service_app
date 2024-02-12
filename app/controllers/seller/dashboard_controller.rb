# frozen_string_literal: true

module Seller
  class DashboardController < ApplicationController
    layout 'seller_dashboard'
    include Pagy::Backend

    def index
      @approved_bookings = Booking.where(status: 'booked')
    end
  end
end
