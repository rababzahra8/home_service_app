module Seller
  class BookingsController < Seller::DashboardController
    # before_action :authenticate_seller!

    def index
      @approved_bookings = Booking.where(status: 'approved')
      @booking_requests = Booking.where(status: 'pending')
      @completed_bookings = Booking.where(status: 'completed')
    end

    def edit
      @booking = Booking.find(params[:id])
    end

    def update
      @booking = Booking.find(params[:id])

      case params[:status]
      when 'approved'
        if @booking.update(status: 'approved')
          # Update the associated service status to 'sold'
          # byebug
          @booking.service.update(status: 'sold')

          redirect_to seller_bookings_path, notice: 'Booking approved successfully.'
        else
          redirect_to seller_bookings_path, alert: 'Failed to update booking status.'
        end
      when 'rejected'
        @booking.update(status: 'rejected')
        redirect_to seller_bookings_path, notice: 'Booking rejected successfully.'
      else
        redirect_to seller_bookings_path, alert: 'Invalid action.'
      end
    end

    private

    def approval_params
      params.require(:booking).permit(:status)
    end
  end
end
