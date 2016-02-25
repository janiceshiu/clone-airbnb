class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = current_user
  end

  def update
  	# byebug
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path
  end

  private
    def user_params
      params.require(:user).permit(:avatar)
    end
end
