class Admin::ServicesController < Admin::DashboardController
  before_action :authenticate_admin!
  before_action :set_service, only: %i[update show_rejected show]

  def index
    @services = Service.all
  end

  def show
  end
  
  def update
    if @service.update(service_params)

      redirect_to admin_services_path, notice: 'Service status updated successfully.'

    else
      redirect_to admin_services_path, alert: 'Failed to update service status.'
    end
  end

  def show_rejected
    # Specific logic for show_rejected if needed
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:status, :comment)
  end
end
