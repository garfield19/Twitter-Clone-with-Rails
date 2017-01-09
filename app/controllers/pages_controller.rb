class PagesController < ApplicationController
  #before_action :authenticate_user! only:[:hub]
require 'twitter-text'
include Twitter::Autolink
 #back end code for pages/index
  
  def index

  end

#back end code for pages/home
  def home
    if (current_user.interest == "")
      redirect_to user_steps_path , :notice => "Please update your profile"
    end
    @title = "Home"
      following_ids = "SELECT followed_id FROM relationships
      WHERE follower_id = ? "
    @updates = Update.all.where("user_id IN(#{following_ids}) OR
      user_id = ?",current_user.id,current_user.id)
    @newUpdate=Update.new
    
  end
#back end code for pages/hub
  def hub
  	if(User.find_by_username(params[:id]))
  	@username = params[:id]
    @title = "#{@username}'s Hub "
    #@birthday = User.find_()
    @user1 = User.find_by_username(params[:id])
  else
  	redirect_to home_path, :notice => "User not found"
end
  	@updates = Update.all.where("user_id = ?",User.find_by_username(params[:id]))
  @newUpdate=Update.new
  
end
#back end code for pages/explore
  def explore
  	@updates = Update.all
  end
  def full_name
[first_name, last_name].join(" ")
end
end
