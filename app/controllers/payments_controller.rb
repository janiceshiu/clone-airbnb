class PaymentsController < ApplicationController
	before_action :require_login

	def new
		@reservation = Reservation.find(params[:reservation_id])
		@no_of_nights = (@reservation.check_out_date - @reservation.check_in_date).to_i
		@rent_per_night = @reservation.listing.rent_per_night
		@total_payment = total_payment(@rent_per_night, @no_of_nights)
		@client_token = gon.client_token = generate_client_token
		# @client_token = generate_client_token
	end

	def create
    @result = Braintree::Transaction.sale(
              amount: 1000,		 #  test number
              payment_method_nonce: params[:payment_method_nonce])
    byebug
    if @result.success?
      redirect_to root_path, notice: "Congratulations! Your transaction is successful. You paid #{@total_payment}."
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      redirect_to help_path
    end
  end

	private
		def total_payment(rent_per_night, no_of_nights)
			total_payment = (rent_per_night * no_of_nights)
		end

	def generate_client_token
		Braintree::ClientToken.generate
	end

end