class ReservationsController < ApplicationController

   def create 
      @reservation = Reservation.new(reservation_param)
      @reservation.user_id = current_user.id
      @reservation.listing_id = params[:listing_id]
      @user = current_user
       # @reservation = current_user.reservations.new() ---- ASK SHENG WHY THAT DOESNT WORK
      # @reservation.user_id = current_user.id
      # @listing = Listing.new(listings_params)
      # @listing.propert_type = params[:property_type]
      # @listing.users_id = current_user.id 
      if @reservation.save  
         redirect_to listings_path
      else

      end
   end

   def edit
      @user = current_user
      @reservation = Reservation.find(params[:id])
   end

   def update
      @reservation = Reservation.find(params[:id])
      @reservation.update(reservation_param)
      redirect_to listings_path
   end

   def destroy
      @reservation = Reservation.find(params[:id])
      @reservation.destroy 
      redirect_to listings_path
   end

private
   def reservation_param
      params.require(:reservation).permit(:check_in,:check_out,:user_id,:listing_id)
   end
end
