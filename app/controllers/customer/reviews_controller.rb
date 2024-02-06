# app/controllers/customer/reviews_controller.rb

class Customer::ReviewsController < Customer::DashboardController
  before_action :authenticate_user!
  before_action :find_service, only: %i[new create]

  def index
    @user_bookings = current_user.bookings.includes(:service)
    @services_with_reviews = @user_bookings.map { |booking| booking.service if booking.service.reviews.present? }.compact
    @booked_services_without_reviews = @user_bookings.map(&:service) - @services_with_reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = @service.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to customer_dashboard_index_path, notice: 'Review was successfully added.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_service
    @service = Service.find(params[:service_id])
  end
end
