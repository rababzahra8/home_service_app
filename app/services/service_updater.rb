# app/services/service_updater.rb

class ServiceUpdater
  def initialize(service, params)
    @service = service
    @params = params
    byebug
  end

  def update_status
    @service.update(@params)
  end
end
