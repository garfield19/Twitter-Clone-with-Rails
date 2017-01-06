class InterestgroupsController < ApplicationController
	before_action :find_interestgroup, only: [:show, :destroy]
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
	def show
		
	end
	def new
		@interestgroup = current_user.interestgroups.build
	end
	def create
		@interestgroup = current_user.interestgroups.build(interestgroups_params)
		if @interestgroup.save
			redirect_to @interestgroup
		else
			render "New"
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

end
