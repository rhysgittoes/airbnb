class UsersController < Clearance::UsersController

require "mini_magick"
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
   @listings = current_user.listings
 	# @listings = Listing.where(user_id: @user.id) 
   @reservations = Reservation.where(user_id: @user.id)
   # @reservationlisting = Reservation.where(listing_id: @listings[0].id)
   current_user.listings
 	render template: "users/show"
 end 

private 
	def user_params
		params.require(:user).permit(:email, :password, :name, :phone, :birthdate, :country, :avatar)
	end 
end
