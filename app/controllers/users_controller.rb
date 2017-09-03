class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash.now[:error] = "We could not register you. Please include all information, and try again."
      render 'new', status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :phone)
  end

end
