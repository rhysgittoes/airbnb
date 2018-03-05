class ListingsController < ApplicationController
require "mini_magick"
	def index
		@user = current_user
		@users = User.all
		@listing = Listing.all
		# @random1 = @listing[rand(0..(@listing.length-1))]
		render template: "listings/index"
	end

	def search
		@user = current_user
		# @listings_city = Listing.where(city: params[:city])
		@listings_filter = Listing.where(

			"city ILIKE ? AND price >= ? AND price <= ? AND room_number = ?",
			"%#{params[:city]}", params[:price_min],params[:price_max],params[:room_number]
			)

#  price >= ?",
		# @listings_price = Listing.where("content LIKE :price", price: params[:price])
		# ^^ Checks listing where the column city is the same as the params city pulled from the search bar

		#params[:query]
		# Listng.where
		render template: "listings/search"
	end

 	def new
	 	@listing = Listing.new
	 	@user = current_user

 	end 

	def create 
		@listing = Listing.new(listings_params)
		# @listing.propert_type = params[:property_type]
		@listing.user_id = current_user.id
		@user = current_user
		if @listing.save	
		redirect_to listings_path
		else
		redirect_back
		end
	end 


	def show
		@user = current_user
		@listing = Listing.find(params[:id])
		@reservation = Reservation.new 
		@reservation.user_id = current_user.id
		render template: "listings/show"
	end

	def edit
		@user = current_user
		@listing = Listing.find(params[:id])
	end


	def update
		@listing = Listing.find(params[:id])
		@listing.update(listings_params)
		redirect_to listings_path
	end

	def destroy
		@listing = Listing.find(params[:id])
		@listing.destroy 
		redirect_to listings_path
	end
	
private 
	def listings_params
		params.require(:listing).permit(:name, :property_type, :room_number, :bed_number, :guest_number, :price, :description, :country, :state, :city, :zipcode, :address, {amenities: []},{images: []})
	end 
end

