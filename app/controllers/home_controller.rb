class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to user_index_path(current_user.number)
    else
      redirect_to login_path
    end
  end
end
