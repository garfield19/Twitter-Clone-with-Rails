class CommunityController < ApplicationController
	before_action :authenticate_user!
  def index
  	@title = "Community"
	@letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split("")
	@community = User.paginate(:page => params[:page], per_page: 10)
	if params[:id]
		@initial = params[:id]
		@community = User.paginate(:page => params[:page], per_page: 10).where("last_name like ? OR first_name like ? OR username like ?", @initial+'%',@initial+'%',@initial+'%')
		#@users = users.collect { |user| user.id }
	end
	if params[:search]
		@search = params[:search]
		@community = User.paginate(:page => params[:page], per_page: 10).WHERE USERNAME::text LIKE '%<%= @search %>%'
  	end
  end

  def browse
  end

  def search
  end
end
