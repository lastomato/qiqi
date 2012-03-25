class UsersController < ApplicationController
  before_filter :logged_in?, :only => [:destroy]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.build(params[:user])

    if @user.try(:save)
      redirect_to user_index_path(@user.number)
    else
      redirect_to register_path, :alert => "Unsuccessful. Please try again!"
    end
  end

  def destroy
    @user ||= User.find_by_number(params[:number])

    if @user.try(:destroy)
    else
    end
  end
end
