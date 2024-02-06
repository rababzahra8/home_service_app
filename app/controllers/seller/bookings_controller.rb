class BookingsController < Seller::DashboardController
  # before_action :authenticate_seller!

  def index
    @approved_bookings = Booking.where(status: 'booked')
  end
end
