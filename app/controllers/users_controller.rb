class UsersController < ApplicationController

#TODO routes

	def index
		@user = User.all
	end
	def new
		@user = User.new
	end

	def create
		@user=User.create(user_params)
		if @user.save
			redirect_to users_path
		else
			render 'new'
		end
	end

def user_params
  params.require(:user).permit(:name, :email,:password,:password_confirmation, :room, :ext_room,:image)
end
end
