class ListingsController < ApplicationController

	def index
	@user = current_user
	@listing = Listing.all
	render template: "listings/index"

	end

 	def new
 	@listing = Listing.new
 	end 


	def create 
	 @listing = Listing.new(listings_params)
	 @listing.save	
	 @user = current_user
	 redirect_to listings_path	
	end 


	private 
	def listings_params
		params.require(:listing).permit(:name, :property_type, :room_number, :bed_number, :guest_number, :price, :description)
	end 
end

