class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_username, :signed_in?

  private

  def current_username
    @current_username ||= User.get_username(session[:user_hash]) if session[:user_hash]
  end

  def signed_in?
    current_username != nil
  end

end