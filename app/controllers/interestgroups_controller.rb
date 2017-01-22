class InterestgroupsController < ApplicationController
	before_action :find_interestgroup, only: [:show, :destroy, :upvote]
	before_action :authenticate_user!
	before_filter :initialize_interestgroup, except: [:show, :upvote]
	def index
		@title = "Interest Group"
		if params[:interest].blank?
		redirect_to home_path, notice: "No interest group chosen"
		#@interestgroups = Interestgroup.all.order("created_at DESC")
		#@interest = Interestgroup.find_by(interest: params[:interest])
	else
		#checking user access here
		@interestgroups = Interestgroup.where(interest: params[:interest]).order("created_at DESC")
	end
	end
	def upvote
		@interestgroup.upvote_by current_user
		redirect_to :back
	end
	def show
		#commontator_thread_show(@commontable)
		
	end
	def new
		@interestgroup = current_user.interestgroups.build
	end
	def create
		@interestgroup = current_user.interestgroups.build(interestgroups_params)
		respond_to do |format|
		if @interestgroup.save
		      format.html{redirect_to (:back) ,notice: "Post succesfully created"	}
		      format.js
		else
			render "New"
		end
		end
		
	end
	def destroy
		@interestgroup.destroy
		redirect_to interestgroups_path
		
	end

	private
	def interestgroups_params
		params.require(:interestgroup).permit(:post, :interest, :interesttype)
	end
	def find_interestgroup
		@interestgroup = Interestgroup.find(params[:id])
	end
	  

  def initialize_interestgroup
    @interestgroup = Interestgroup.new
  end

end
