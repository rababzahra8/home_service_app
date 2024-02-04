# app/controllers/customers/bookings_controller.rb
module Customers
  class BookingsController < ApplicationController
    before_action :authenticate_user!

    def new
      @service = Service.find_by(id: params[:service_id])
      @booking = current_user.bookings.new(service: @service)
    end

    def create
      @service = Service.find_by(id: params[:booking][:service_id])
      @booking = current_user.bookings.new(booking_params.merge(status: 'pending'))

      if @booking.save
        redirect_to root_path, notice: 'Booking request sent successfully. Waiting for approval.'
      else
        redirect_to root_path, alert: 'Failed to send booking request.'
      end
    end

    private

    def booking_params
      params.require(:booking).permit(:service_id, :status)
    end
  end
end
