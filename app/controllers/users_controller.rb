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
 		render template: "users/new"
 	end

 end 

 def show
 	@user = current_user
 	@listings = Listing.where(users_id: @user.id)
   @reservations = Reservation.where(user_id: @user.id)
 	render template: "users/show"
 end 

private 
	def user_params
		params.require(:user).permit(:email, :password, :name, :phone, :birthdate, :country)
	end 
end
