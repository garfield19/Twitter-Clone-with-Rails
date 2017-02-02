class RelationshipsController < ApplicationController

def create
	user = User.find(params[:followed_id])
	current_user.follow(user)
	Notification.create(recipient: user,actor: current_user, action: "connected with you")
	redirect_to(:back)
end


def destroy
	user = Relationship.find(params[:id]).followed
	current_user.unfollow(user)
	redirect_to(:back)
	
end
end