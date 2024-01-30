# frozen_string_literal: true

module DeviseParamsSetter
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  protected

  def devise_user_params(type = nil)
    # new_params = [:avatar, :avatar_cache, :first_name, :last_name]
    new_params = %i[name role age gender]
    # edit_params = new_params.push(:phone_number)
    edit_params = new_params

    case type
    when :sign_up
      new_params
    when :account_update
      # edit_params.push(:sth_else)
      edit_params
    else
      edit_params.push(:email)
    end
  end

  def configure_permitted_parameters
    %i[sign_up account_update].each { |a| devise_parameter_sanitizer.permit(a, keys: devise_user_params(a)) }
  end
end
