# frozen_string_literal: true

module User
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def after_sign_up_path_for(_resource)
      root_path
    end

    def after_update_path_for(_resource)
      edit_user_registration_path
    end

    def configure_permitted_parameters
      # Add phone_number, email_notifications, and message_notifications to the permitted parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[name age role gender])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[name age role gender])
    end
  end
end
