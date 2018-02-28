class ReservationMailer < ApplicationMailer
   default from: 'mailpairbnb@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_mailer.Mailer.subject
  #
  def reservation_to_booker(user)
   @user = user 
   @url  = 'http://example.com/login'
   mail(to: @user.email, subject: 'Reservation Confirmed!')
  end


  
end


