class ListingsController < ApplicationController

	def index
	@user = current_user
	@listing = Listing.all
	render template: "listings/index"
	end

 	def new
 	@listing = Listing.new
 	@user = current_user
 	end 



	def create 
	 @listing = Listing.new(listings_params)
	 # @listing.propert_type = params[:property_type]
	 @listing.users_id = current_user.id
	 @user = current_user
	 redirect_to listings_path
	 if @listing.save	
	 	redirect_to listings_path
	 else
	 	redirect_back
	 end
	end 





	def show
		@user = current_user
	end

	def edit
		@user = current_user

		@listing = Listing.find(params[:id])
	end

	def update
	end


	private 
	def listings_params
		params.require(:listing).permit(:name, :property_type, :room_number, :bed_number, :guest_number, :price, :description, :country, :state, :city, :zipcode, :address)
	end 
end

