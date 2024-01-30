# app/controllers/seller/services_controller.rb
class Seller::ServicesController < Seller::DashboardController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_service, only: %i[show destroy resolve_rejection request_re_approval]

  def index
    @services = current_user.services
  end

  def show
    @reviews = @service.reviews
  end

  def new
    @service = current_user.services.build
  end

  def create
    @service = current_user.services.build(service_params.merge(status: 'pending'))

    if @service.save
      redirect_to seller_services_path, notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @service.destroy
    redirect_to seller_services_path, notice: 'Service was successfully deleted.'
  end

  def resolve_rejection
    @service.update(status: 'pending')
    redirect_to seller_services_path, notice: 'Service is pending re-approval.'
  end

  def request_re_approval
    # Additional logic for notifying admin or handling re-approval request
    redirect_to seller_services_path, notice: 'Re-approval requested.'
  end

  private

  def set_service
    @service = current_user.services.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :category_id, :price)
  end
end
