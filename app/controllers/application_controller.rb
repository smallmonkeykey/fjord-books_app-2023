# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[zip address introduction])
  end

  def after_sign_in_path_for(resource)
    books_path(resource)
  end

  def after_sign_out_path_for(resource)
    new_user_registration_path(resource)
  end

  def after_update_path_for(resource)
    books_path(resource)
  end
end
