class SessionsController < ApplicationController
  def new
  end
  def create

	  user = User.find_by(email: params[:email])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    if user.id == 1
	    	redirect_to orders_path
	    else
	    	redirect_to orders_new_path
	    end
	  else
	    # flash.now[:error] = 'Email or password is invalid'
	    render 'new',  notice: 'Email or password is invalid'
	  end
	end
	def destroy
	  session[:user_id] = nil
	  redirect_to login_path
	end
	
end
