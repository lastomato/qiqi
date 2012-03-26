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

<<<<<<< HEAD
  def single
    @user ||= User.find_by_username(params[:username])
  end

=======
>>>>>>> a7b7f2d06edb2e5708607ecada84a371ac29506f
  def destroy
    @user ||= User.find_by_number(params[:number])

    if @user.try(:destroy)
<<<<<<< HEAD
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "shared/fail_to_destroy" }
      end
=======
    else
>>>>>>> a7b7f2d06edb2e5708607ecada84a371ac29506f
    end
  end
end
