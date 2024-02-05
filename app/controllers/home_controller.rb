# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @services = Service.where(status: 'approved')
  end

  def all_services
    @categories = Category.all

    if params[:category_id].present?
      @selected_category = Category.find(params[:category_id])
      @services = @selected_category.services
    else
      @services = Service.all
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
