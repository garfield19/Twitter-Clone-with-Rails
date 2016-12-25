class UpdatesController < ApplicationController
	
	def new
		@updates = Update.new
	end
	def create
		@updates = Update.new(update_params)
		@updates.user_id = current_user.id
		respond_to do |f|
			if (@updates.save)
				f.html {redirect_to "", Notice: "Update Successful"}
			else
				f.html {redirect_to "", Notice: "Update Failed"}
			end

	end
end
private
def update_params
	params.require(:update).permit(:user_id, :content)

end
	
end
