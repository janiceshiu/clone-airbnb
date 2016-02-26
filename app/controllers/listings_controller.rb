class ListingsController < ApplicationController

	def index
		# @listings = Listing.all
		# @listings = Listing.all.sort
		@listings = Listing.all.paginate(:page => params[:page], per_page: 3).order('created_at ASC')
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
		listing = Listing.find(params[:id])
  	listing.update(listing_params)
  	redirect_to listing_path
		# WIP
	end

	def destroy
		# WIP
	end

  private
  def listing_params
    params.require(:listing).permit(:user_id, :rent_per_night, :no_of_guests, :street_address, :city,
    	:state, :country, :room_type, :description, :house_rules, {images: []})
  end

end
