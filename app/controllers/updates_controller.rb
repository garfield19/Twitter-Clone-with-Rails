class UpdatesController < ApplicationController
	before_action :set_update, only:[:upvote, :downvote]
	before_action :authenticate_user!, only:[:new,:upvote, :show, :downvote, :create, :new]
	
	respond_to :js, :json, :html
	def show
	  @update = Update.find(params[:id])
	end
def upvote
		@update.upvote_from current_user
		Notification.create(recipient: User.find(@update.user_id),actor: current_user, action: "Liked your update")
		redirect_to(:back)

	end
	def downvote
		@update.downvote_from current_user
		Notification.create(recipient: User.find(@update.user_id),actor: current_user, action: "Disliked your update")
		redirect_to(:back)
	end
	def new
		@updates = Update.new
	end
	def create
		@updates = Update.new(update_params)
		@updates.user_id = current_user.id
		respond_to do |f|
			if (@updates.save)
				f.html {redirect_to (:back), Notice: "Update Successful"}
			else
				f.html {redirect_to "", Notice: "Update Failed"}
			end

	end
	
	
end
private
def update_params
	params.require(:update).permit(:user_id, :content, :image)

	end
	def set_update
		@update = Update.find(params[:id])
	end

end