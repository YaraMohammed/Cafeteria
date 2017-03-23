class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # layout "users_header"
  layout "admin_header"

end
