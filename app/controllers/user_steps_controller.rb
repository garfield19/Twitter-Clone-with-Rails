class UserStepsController < ApplicationController
include Wicked::Wizard
before_action :authenticate_user!
steps :personal, :hub, :social


def show
	@user = current_user
	render_wizard
end

def update
	@user = current_user
	@user.attributes = params[:user].permit(:first_name,:ig, :phone_no,:whatsapp, :facebook,:twitter,:last_name, :gender, :skills, :about, :hub_type, :birthday,  :avatar, interest:[])

	render_wizard @user
end

private

def finish_wizard_path
	home_path(current_user)
end
end
