# frozen_string_literal: true

class Admin::ServicesController < Admin::DashboardController
  before_action :authenticate_admin!
  before_action :set_service, only: [:update]

  def index
    @services = Service.all
    # @reapproval_requests = Service.where(status: 'reapproval')
  end

  def update
    if @service.update(service_params)
      if @service.rejected?
        redirect_to admin_services_path, notice: 'Service rejected successfully.'
      else
        redirect_to admin_services_path, notice: 'Service status updated successfully.'
      end
    else
      redirect_to admin_services_path, alert: 'Failed to update service status.'
    end
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:status, :rejection_reason, :reapproval_request)
  end
end
