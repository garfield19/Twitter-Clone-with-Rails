class PagesController < ApplicationController
before_action :authenticate_user! ,only:[:hub, :home, :groups]
require 'twitter-text'
include Twitter::Autolink
 #back end code for pages/index
  
  def index

  end
  def groups
     @arr1 = current_user.interest.split(",") 
  end
  def explore
    @updates = Update.all
  end

#back end code for pages/home
  def home
    @messages = Message.all.order('RANDOM()').limit(5)
    if (current_user.interest == "")
      redirect_to user_steps_path , :notice => "Please update your profile"
    end
    @newUpdate=Update.new
    @title = "Home"
      following_ids = "SELECT followed_id FROM relationships
     WHERE follower_id = ? "
    @updates = Update.all.where("user_id IN(#{following_ids}) OR
      user_id = ?",current_user.id,current_user.id).paginate(page: params[:page], per_page: 6).order(created_at: :desc)
   # @updates = Update.paginate(page: params[:page], per_page: 6).order(created_at: :desc)
    respond_to do |format|
      format.html
      format.js
    end
  end
#back end code for pages/hub
  def hub
  	if User.find_by_username(params[:id])
  	@username = params[:id]
    @title = "#{@username}'s Hub "
    @user1 = User.find_by_username(params[:id])
  end
  if !User.find_by_username(params[:id]).present?
  	redirect_to home_path, :notice => "User not found"
  	end

  	@updates = Update.all.where("user_id = ?",User.find_by_username(params[:id]))
  @newUpdate=Update.new
  @message = Message.all.where("user_id = ?", @user1.id)
  
end
def show
  @update = Update.find(params[:id])
end
#back end code for pages/explore
  
  def full_name
[first_name, last_name].join(" ")
end
end
