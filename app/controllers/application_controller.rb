class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # layout "users_header"
  layout "admin_header"

  private

	def logged_in?
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	helper_method :logged_in?

end
