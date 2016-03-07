class SearchesController < ApplicationController

  def index
    if params[:query].present?
    	@listings = Listing.search(params[:query], where: {user_id: {not: current_user.id}}, page: params[:page], per_page: 2)
      @query = params[:query]
    else
      @listings = Listing.all.page params[:page]
    end
  end

end
