class OrdersController < ApplicationController
	def index
		@product=Product.all

		@order =Order.new
	end
	def new
		@product=Product.all

		@order = Order.new
		# render 'new'

	end
	def order_params
  		params.require(:user).permit(:name, :email,:password,:password_confirmation, :room, :ext_room,:image)
	end


end