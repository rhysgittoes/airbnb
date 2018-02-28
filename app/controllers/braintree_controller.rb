class BraintreeController < ApplicationController
  def new
      @user = current_user
      @client_token = Braintree::ClientToken.generate
      @reservation = Reservation.find(Reservation.ids)
  end

  def checkout #listings/:listing_id/reservations/:id/brain/checout
   @reservation = Reservation.find(params[:reservation_id])
   @listing = @reservation.listing

   total = @listing.price * (@reservation.check_out - @reservation.check_in).to_i
   
  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]
  
  result = Braintree::Transaction.sale(
   :amount => total, #this is currently hardcoded
   :payment_method_nonce => nonce_from_the_client,
   :options => {
      :submit_for_settlement => true
    }
   )

  if result.success?
   @reservation.update_attribute("payed", true)
    redirect_to :root, :flash => { :success => "Transaction successful!" }
  else
    redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
  end
end



# private 
#    def reservations_params
#       params.require(:reservation).permit(:id)
#    end 
end
