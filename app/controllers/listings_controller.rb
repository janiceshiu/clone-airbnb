class ListingsController < ApplicationController
	before_action :require_login, only: [:index]

	def index
    @listings = Listing.where(user_id: current_user.id)
	end

  def autocomplete
    render json: Book.search(params[:query], autocomplete: true, limit: 10).map(&:country)
  end

	def new
		@listing = Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		@listing.user_id = current_user.id
		if @listing.save
			# flash message: "Congratulations, you've created a listing."
			redirect_to edit_listing_path(@listing.id)
		else
			# Error messages not showing.
			@errors = @listing.errors.full_messages
			render 'new'
		end
	end

	def show
		@l = Listing.find(params[:id])
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		listing = Listing.find(params[:id])
		# byebug
  	listing.update!(listing_params)
  	redirect_to listing_path
		# WIP - listing.published == true when listing fully filled out.
	end

	def destroy
		# WIP
	end

	def test
	end

  private
  def listing_params
    params.require(:listing).permit(:user_id, :rent_per_night, :no_of_guests, :house_number, :street_address, :city, :postcode,
    	:state, :country, :room_type, :property_type, :description, :house_rules, {images: []}, :published, :title, :lat, :lng)
  end

end
