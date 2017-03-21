class UsersController < ApplicationController

#TODO routes

	def new
		render 'new'
	end

	def index
		@users = Users.all
	end

	def show
	end

#TODO ... get uploaded file to public and save the url in the database
	def create
	  @user = User.new(params[:user])
	 
	  @user.save
	  redirect_to @user
	end
end
