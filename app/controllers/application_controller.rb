# frozen_string_literal: true

# Controller for the application
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Function to allow the access to the lists after sign in
  def after_sign_in_path_for(resource)
    lists_path
  end

  protected

  # Function to define which parameters are allowed
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end
end
