class Seller::ServicesController < Seller::DashboardController
  before_action :authenticate_seller!, only: %i[create destroy]
  before_action :set_service, only: %i[show destroy reapprove edit update]

  def index
    @pagy_approved, @approved_services = pagy(Service.where(status: 'approved'))
    @pagy_pending, @pending_services = pagy(Service.where(status: 'pending'))
    @pagy_rejected, @rejected_services = pagy(Service.where(status: 'rejected'))
    @pagy_reapproval, @reapproval_request = pagy(Service.where(status: 'reapproval'))
  end

  def show
    @reviews = @service.reviews
  end

  def new
    @service = current_user.services.build
  end

  def edit; end

  def create
    @service = current_user.services.build(service_params.merge(status: 'pending'))

    if @service.save
      redirect_to seller_services_path, notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  def update
    if @service.update(service_params)
      redirect_to seller_services_path, notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @service.destroy
    redirect_to seller_services_path, notice: 'Service was successfully deleted.'
  end

  def reapprove
    @services = Service.where(status: 'rejected')

    @service.update(status: 'reapproval', reapproval_request: params[:service][:reapproval_request])

    redirect_to seller_services_path, notice: 'Reapproval request sent successfully.'
  end

  private

  def set_service
    @service = current_user.services.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :category_id, :price, :reapproval_request, :rejection_reason, :avatar)
  end
end
