class OrdersController < ApplicationController
	def index
		@current_user
		@product=Product.all

		@order =Order.new
	end
	def new
		puts "testtt"
		#@user=logged_in?
		# @user=@current_user
		if logged_in?
			puts "uid"	
			puts @current_user.id
			puts "--------------"
			puts "testtt"		
			@user.inspect 
		end
		# @uroom=User.uniq.pluck(:room)
		@product=Product.all

		@order = Order.new
		# render 'new'
	end

	def order_params
  		# params.require(:user).permit(:name, :email,:password,:password_confirmation, :room, :ext_room,:image)
	end


	def create

		@product=Product.all
		# puts data
		render 'new'
	end
	def list
	end



	# def order_params
 #  		params.require(:order)#.permit(:name, :email,:password,:password_confirmation, :room, :ext_room,:image)
	# end


end

