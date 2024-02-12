# app/controllers/customer/reviews_controller.rb

class Customer::ReviewsController < Customer::DashboardController
  before_action :authenticate_user!
  before_action :find_booking, only: %i[new create]
  before_action :find_service, only: %i[new create]

  def index
    @user_bookings = current_user.bookings.includes(:service, :review)
    @services_with_reviews = @user_bookings.select { |booking| booking.review.present? }.map(&:service)
    @booked_services_without_reviews = @user_bookings.select { |booking| booking.review.nil? }.map(&:service)
  end

  def new
    @review = @booking.build_review
  end

  def create
    @review = @booking.build_review(review_params.merge(user_id: current_user.id, service_id: @booking.service_id))

    if @review.save
      redirect_to customer_dashboard_index_path, notice: 'Review was successfully added.'
    else
      redirect_to customer_dashboard_index_path, notice: 'Review not added.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_booking
    @booking = Booking.find_by(service_id: params[:service_id], user_id: current_user.id)
  end

  def find_service
    @service = @booking.service
  end
end
