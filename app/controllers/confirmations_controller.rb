class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
    #render 'devise/registrations/new_user_details'
	#render 'devise/shared/links' 
	user_steps_path(resource)
  end
end