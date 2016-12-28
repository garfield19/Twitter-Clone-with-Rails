class UserStepsController < ApplicationController
include Wicked::Wizard
before_action :authenticate_user!
steps :personal, :hub

def show
	@user = current_user
	render_wizard
end

def update
	@user = current_user
	@user.attributes = params[:user].permit(:first_name, :last_mame, :about, :birthday, :interest, :avatar)

	render_wizard @user
end

private

def finish_wizard_path
	home_path(current_user)
end
end
