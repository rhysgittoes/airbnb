class UsersController < Clearance::UsersController

 def new 
 	@user = User.new
	render template: "users/new"
 end 

 def create 
 	@user = User.new(user_params)
 	if @user.save 
 		sign_in @user
 		redirect_back_or url_after_create
 		cookies[:user_id] = @user.id 
 	else 
 		render template: "users/view"
 	end

 end 


private 

	def user_params
		params.require(:user).permit(:email, :password, :name)
	end 


end