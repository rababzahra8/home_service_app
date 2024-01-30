# frozen_string_literal: true

module Admin
  class CategoriesController < Admin::DashboardController
    before_action :authenticate_admin!
    before_action :set_category, only: %i[destroy]

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = current_user.categories.new(category_params)

      if @category.save
        redirect_to admin_categories_path, notice: 'Category was successfully created.'
      else
        render :new
      end
    end

    def destroy
      @category.destroy

      redirect_to admin_categories_path, notice: 'Category was successfully deleted.'
    end

    private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :user_id)
    end
  end
end
