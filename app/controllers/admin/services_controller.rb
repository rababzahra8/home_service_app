# app/controllers/admin/services_controller.rb
class Admin::ServicesController < Admin::DashboardController
  before_action :authenticate_admin!
  before_action :set_services, only: %i[index update_status]

  def index
    respond_to do |format|
      format.html
      format.turbo_stream # Add this line to handle Turbo Streams
    end
  end

  def update_status
    set_service
    if @service.update(service_params)
      render turbo_stream: turbo_stream.replace(@service, partial: 'admin/services/service_item', locals: { service: @service })
    else
      render 'index'
    end
  end

  private

  def set_services
    case params[:status]
    when 'new'
      @services = Service.where(status: 'pending')
    when 'approved'
      @services = Service.where(status: 'approved')
    when 'rejected'
      @services = Service.where(status: 'rejected')
    else
      @services = Service.all
    end
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:status, :comment)
  end
end
