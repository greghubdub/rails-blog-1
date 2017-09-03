class SessionsController < ApplicationController

  def new
    @user = User.new
    session[:user_id] = nil
  end

  def create
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path, alert: "Welcome! Time to blahg."
    else
      flash.now[:error] = "We could not log yu in. Plz check your email & password and try again."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You have successfully logged out of the blahg."
  end

end
