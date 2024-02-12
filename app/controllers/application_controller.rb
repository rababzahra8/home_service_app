# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include DeviseParamsSetter
  include Pagy::Backend

  protected

  def after_sign_in_path_for(_resource)
    root_path
  end

  private

  def authenticate_seller!
    authenticate_user!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user.seller?
  end

  def authenticate_admin!
    authenticate_user!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user.admin?
  end

  def authenticate_customer!
    authenticate_user!
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user.customer?
  end

  rescue_from CanCan::AccessDenied do |_exception|
    flash[:alert] = 'Access denied.'
    redirect_to root_url
  end
end
