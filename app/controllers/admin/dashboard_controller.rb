# frozen_string_literal: true

module Admin
  class DashboardController < ApplicationController
    layout 'admin_dashboard'

    def index
      @total_users = User.count
      @total_sellers = User.where(role: 'seller').count
      @total_customers = User.where(role: 'customer').count
      @total_services = Service.count
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_dashboard_index_path, notice: 'User was successfully deleted.'
    end
  end
end
