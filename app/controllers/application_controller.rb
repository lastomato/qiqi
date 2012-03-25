class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  private

  def current_user
    @user ||= User.where(:number => session[:user_id]).first if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end
end
