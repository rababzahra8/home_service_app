# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @services = Service.where(status: 'approved')
  end

  def all_services
    @services = if params[:search].present?
                  Service.where(status: 'approved').where('LOWER(title) LIKE ?', "%#{params[:search].downcase}%")
                else
                  Service.where(status: 'approved')
                end
  end
end
