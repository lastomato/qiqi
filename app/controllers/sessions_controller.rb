class SessionsController < ApplicationController
  layout "index"

  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:user_id] = user.number
      redirect_to user_index_url, :notice => "Logged in successfully!"
    else
      redirect_to login_url, :alert => "Invalid username or password, please try again!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out successfully!"
  end
end
