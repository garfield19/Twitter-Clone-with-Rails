class PagesController < ApplicationController
 #back end code for pages/index
  
  def index

  end

#back end code for pages/home
  def home
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
  else
  	redirect_to root_path, :notice => "User not found"
end
  	@updates = Update.all.where("user_id = ?",User.find_by_username(params[:id]))
  @newUpdate=Update.new
  
end
#back end code for pages/explore
  def explore
  	@updates = Update.all
  end
end
