class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,:email , :password_confirmation,:password, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:username,:email ,:password, :remember_me, :login])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username,:email , :password_confirmation,:password, :remember_me, :current_password])
  end
end

