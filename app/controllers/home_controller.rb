# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @services = Service.where(status: 'approved')
  end

  def all_services
    @categories = Category.all

    if params[:category_id].present?
      @selected_category = Category.find(params[:category_id])
      @services = @selected_category.services.where(status: 'approved')
      # render turbo_stream: [
      #   turbo_stream.replace('catageory', partial: 'servicces', locals: { service: @services })
      #   turbo_stream.remove('')
      # ]
    else
      @services = Service.where(status: 'approved')
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
