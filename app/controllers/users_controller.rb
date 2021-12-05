class UsersController < ActionController

	def edit
		@user = User.new()
		@user.username = "Vicente Simao"
	end
end