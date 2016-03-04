class ListingsController < ApplicationController

	def index
    if params[:query].present?
    	@listings = Listing.search(params[:query], page: params[:page], per_page: 2)
      @query = params[:query]
    else
      @listings = Listing.all.page params[:page]
    end
	end

  def autocomplete
    render json: Listing.search(params[:query], {
      fields: [{ country: :word_start }],
      limit: 10,
      load: false,
    })
  end

 #  def typeahead
 #  	render json: Listing.where(country: params[:query])
	# end

## note:  the above will only return exact matches.
## depending on the database being used,
## something else may be more appropriate.
## here is an example for postgres
## for case-insensitive partial matches:

	# def typeahead
 #  	render json: Model.where('name ilike ?', "%#{params[:query]}%")
	# end



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
		@l = Listing.find(params[:id])
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
