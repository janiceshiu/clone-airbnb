class ReservationMailer < ApplicationMailer

  def confirm_reservation(reservation)
    @user = reservation.user
    @reservation = reservation
    @login_url = 'http://localhost:3000/sign_in'
    mail(to: @user.email, subject: 'You have booked a listing')
  end
end
