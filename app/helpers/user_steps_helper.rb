module UserStepsHelper
	def checked(area)
		@user.interest.nil? ? false : @user.interest.match(area)
	end
end
