class UsersController < ApplicationController
  before_filter :logged_in?, :only => [:destroy]
  layout "index", :only => [:new]

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])

    if @user.try(:save)
      redirect_to user_index_path(@user.number)
    else
      redirect_to register_path, :alert => "Unsuccessful. Please try again!"
    end
  end

  def single
    @user ||= User.find_by_username(params[:username])
  end

  def destroy
    @user ||= User.find_by_number(params[:number])

    if @user.try(:destroy)
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "shared/fail_to_destroy" }
      end
    end
  end
end
