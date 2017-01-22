class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_message
	before_action :find_comment,only:[:edit,:update, :destroy]
	def create
		@comment = @message.comments.create(comment_params)
		@comment.user_id = current_user.id

		if @comment.save
			#(@message.users.uniq - [current_user]).each do |user|
			(@message.users.uniq - [current_user]).each do |user|
			 Notification.create(recipient: user,actor: current_user, action: "posted", notifiable: @message)
			end
			
			Notification.create(recipient: @message.user,actor: current_user, action: "posted", notifiable: @message)
			redirect_to message_path(@message)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @comment.update(comment_params)
			redirect_to message_path(@message)
		else
			render 'edit'
		end
	end

def destroy
	@comment.destroy
	redirect_to message_path(@message)
	
end
	private

	def comment_params
		params.require(:comment).permit(:content)
	end
	def find_message
		@message = Message.find(params[:message_id])
	end
	def find_comment
		@comment = @message.comments.find(params[:message_id])
	end
end
