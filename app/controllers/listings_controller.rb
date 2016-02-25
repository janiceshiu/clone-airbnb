class ListingsController < ApplicationController

	def index
	end

	def new
	end

	def create
		new_listing = Listing.new(listing_params)
		new_listing.user_id = current_user.id
		if new_listing.save
			redirect_to user_path(current_user.id)
		else
			redirect_to new_listing_path
		end
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
	end

	def destroy
	end

  private
  # Using a private method to encapsulate the permissible parameters is just a good pattern
  # since you'll be able to reuse the same permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def listing_params
    params.require(:listing).permit(:rent_per_night, :no_of_guests, :street_address, :city,
    	:state, :country, :room_type, :description, :house_rules)
  end
end
