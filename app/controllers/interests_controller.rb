class InterestsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_interest, only: [:show, :edit, :update, :destroy]
	def index
		@title = "Interest Group"
		if params[:category].blank?
		@interests = Interest.all.order("created_at DESC")
		#@interests = Interest.paginate(interest: params[:interest], per_interest: 15).order('created_at DESC')
	else
		@category_id = Category.find_by(name: params[:category]).id
		@interests = Interest.where(category_id: @category_id).order("created_at DESC")
	end
	end

	def new
		@title = "New Interest"
		@interest = Interest.new
		#@interest = current_user.topic.build
	end
	def create
		@interest = Interest.new(interest_params)
		if @interest.save
			redirect_to interests_path
		else
			render 'new'
		end
	end
	def show
		@title = @interest.title
	end
	def edit
		@title = "Edit Interest"
	end
	def update
		@title = "Edit Interest"
		if @interest.update(interest_params)
			redirect_to interests_path
		else
			render 'edit'
		end
	end
def destroy
	@interest.destroy
	redirect_to interests_path
end
	private
	def interest_params
		params.require(:interest).permit(:title, :description, :contact, :category_id)
	end
	def find_interest
		@interest = Interest.find(params[:id])
	end
end
