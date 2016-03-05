class ListingsController < ApplicationController

	def index
    if params[:query].present?
    	# @listings = Listing.search(params[:query] || "*")
    	@listings = Listing.search(params[:query], where: {user_id: {not: current_user.id}}, page: params[:page], per_page: 2)

      @query = params[:query]
      # @products = Product.search "milk", page: params[:page], per_page: 20
    else
      @listings = Listing.all.page params[:page]
    end
	end

  def autocomplete
    render json: Book.search(params[:query], autocomplete: true, limit: 10).map(&:country)
  end

	def new
	end

	def create
		@new_listing = Listing.new(listing_params)
		@new_listing.user_id = current_user.id
		if @new_listing.save
			# flash message: "Congratulations, you've created a listing. Before other people can rent your place, please supply more details about your listing "
			redirect_to edit_listing_path(@new_listing.id)
		else
			# Error messages not showing.
			# flash.now[:error] = @new_listing.errors.full_messages
			redirect_to new_listing_path
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
  	listing.update(listing_params)
  	redirect_to listing_path
		# WIP - listing.published == true when listing fully filled out.
	end

	def destroy
		# WIP
	end

  private
  def listing_params
    params.require(:listing).permit(:user_id, :rent_per_night, :no_of_guests, :street_address, :city,
    	:state, :country, :room_type, :property_type, :description, :house_rules, {images: []})
  end

end
