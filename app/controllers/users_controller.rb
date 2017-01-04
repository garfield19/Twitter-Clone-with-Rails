class UsersController < ApplicationController
	before_action :find_user
	def index
		# @user_id = User.find_by_username(params[:id])
		following_ids = "SELECT followed_id FROM relationships
      	WHERE follower_id = ? "
       	@users = User.all.where("id IN(#{following_ids})",current_user.id) 
	#@users = User.all.where("id = ?",User.find_by_username(params[:id]))
	end
	def connects
		# @user_id = User.find_by_username(params[:id])
		following_ids = "SELECT followed_id FROM relationships
      	WHERE follower_id = ? "
       	@users = User.all.where("id IN(#{following_ids})",current_user.id) 
       	#redirect_to("users/connects")
	#@users = User.all.where("id = ?",User.find_by_username(params[:id]))
	end
	def networks
		# @user_id = User.find_by_username(params[:id])
		follower_ids = "SELECT follower_id FROM relationships
      	WHERE followed_id = ? "
       	@users = User.all.where("id IN(#{follower_ids}) OR
       	id = ?",current_user.id,current_user.id) 
	#@users = User.all.where("id = ?",User.find_by_username(params[:id]))
	end
def find_user
		@user = User.find_by_username(params[:id])
	end
end