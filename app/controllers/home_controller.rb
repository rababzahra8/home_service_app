# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @services = Service.where(status: 'approved').limit(4)
  end

  def all_services
    @services = if params[:search].present?
                  Service.where(status: 'approved').where('LOWER(title) LIKE ?', "%#{params[:search].downcase}%")
                else
                  Service.where(status: 'approved')
                end
  end

  def show
    @service = Service.find(params[:id])
  end

  def book_service
    @service = Service.find(params[:id])
    @booking = current_user.bookings.new(service: @service)

    if @booking.save
      redirect_to root_path, notice: 'Service booked successfully.'
    else
      redirect_to root_path, alert: 'Failed to book the service.'
    end
  end
end
