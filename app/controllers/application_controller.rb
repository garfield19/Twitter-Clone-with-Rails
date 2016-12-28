class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email , :password_confirmation,:password, :remember_me,:hub_type,:phone_no,:about,:avatar,:interest, :cover_img, :first_name, :last_name, :birthday])
    devise_parameter_sanitizer.permit(:sign_in,keys: [:username,:email , :password_confirmation,:password, :remember_me])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username,:email , :password_confirmation,:password, :remember_me,:hub_type,:phone_no,:about,:avatar,:interest, :cover_img, :first_name, :last_name, :birthday])
  end

end

