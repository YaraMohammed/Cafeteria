class SessionsController < ApplicationController
  def new
  end
  def create

	  user = User.find_by(email: params[:email])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to orders_new_path, notice: 'Logged in!'
	  else
	    flash.now.alert = 'Email or password is invalid'
	    render :new
	  end
	end
	def destroy
	  session[:user_id] = nil
	  redirect_to login_path, notice: 'Logged out!'
	end
	
end
