class UsersController < ApplicationController
	before_action :find_user
	before_action :authenticate_user!
	def index
		# @user_id = User.find_by_username(params[:id])
		following_ids = "SELECT followed_id FROM relationships
      	WHERE follower_id = ? "
       	@users = User.all.where("id IN(#{following_ids})",(params[:id])) 
	#@users = User.all.where("id = ?",User.find_by_username(params[:id]))
	end
	def connects
		@title = "Connects list"
		# @user_id = User.find_by_username(params[:id])
		following_ids = "SELECT followed_id FROM relationships
      	WHERE follower_id = ? "
       	@users = User.all.where("id IN(#{following_ids})",(params[:id])) 
       	#redirect_to("users/connects")
	#@users = User.all.where("id = ?",User.find_by_username(params[:id]))
	end
	def networks
		@title = "Network List"
		# @user_id = User.find_by_username(params[:id])
		follower_ids = "SELECT follower_id FROM relationships
      	WHERE followed_id = ? "
       	@users = User.all.where("id IN(#{follower_ids})",(params[:id])) 
	#@users = User.all.where("id = ?",User.find_by_username(params[:id]))
	end
def find_user
		@user = User.find_by_username(params[:id])
		#@user1 = User.find_by_username(params[:id])
	end
end