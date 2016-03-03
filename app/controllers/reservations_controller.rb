class ReservationsController < ApplicationController

  def index
  	@user = current_user
  end

  def new
  	@listing = Listing.find(params[:listing_id])
  end

  def create
  	test_reservation = Reservation.find(2) # use this reservation for testing purposes.
		# new_reservation = Reservation.new(reservation_params)
		# new_reservation.user_id = current_user.id
		if test_reservation.id == 2 # this is to prevent a lot of reservations being created during testing.
		# if new_reservation.save # commenting out to prevent a lot of reservations being created during testing.
			redirect_to new_reservation_payment_path(test_reservation.id)
			# ReservationMailer.confirm_reservation(new_reservation).deliver_later		 # commenting out to prevent a lot of emails being sent during testing
			# redirect_to new_payment_path
			# redirect_to user_path(current_user.id)
		else
			redirect_to new_reservation_path
		end
  end

  def show
  end

  def edit
  	@reservation = Reservation.find(params[:id])
  	# WIP
  end

  def update
  	# WIP
  end

  def destroy
  	# WIP
  end

  private
    def reservation_params
      params.require(:reservation).permit(:user_id, :listing_id, :no_of_guests, :check_in_date, :check_out_date)
    end

end
