# app/controllers/customers/bookings_controller.rb
class Customer::BookingsController < Customer::DashboardController
  before_action :authenticate_user!

  def index
    @booked_services = current_user.bookings.includes(:service).map(&:service)
  end

  private

  def booking_params
    params.require(:booking).permit(:service_id, :status)
  end
end
