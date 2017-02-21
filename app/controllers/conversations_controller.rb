class ConversationsController < ApplicationController
	before_action :authenticate_user!
	def index
		@conversations = current_user.mailbox.conversations
	end
	def show
		@conversation = current_user.mailbox.conversations.find(params[:id])
	end
	def new
		follow = "SELECT followed_id FROM relationships
     WHERE follower_id = ? "
 		@recepients = User.all.where("id IN(#{follow})", current_user.id)
		#@recepients = User.all - [current_user]
		if(User.find_by_username(params[:id]))
			@clause = 0
			@receivenig = User.find_by_username(params[:user])
			@recepientsl = @receivenig.id
		end
	end
	def create
		recepient = User.find(params[:user_id])
		receipt = current_user.send_message(recepient, params[:body], params[:subject])
		Notification.create(recipient: recepient,actor: current_user, action: "started a conversation")
		redirect_to conversation_path(receipt.conversation)
	end

end