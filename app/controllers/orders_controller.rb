class OrdersController < ApplicationController
	def index
		@product=Product.all

		@order =Order.new
	end
	def new
		# @uroom=User.uniq.pluck(:room)
		@product=Product.all

		@order = Order.new
		# render 'new'

	end

	def create

		@product=Product.all
		# puts data
		render 'new'
	end



	# def order_params
 #  		params.require(:order)#.permit(:name, :email,:password,:password_confirmation, :room, :ext_room,:image)
	# end


end