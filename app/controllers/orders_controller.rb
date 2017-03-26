class OrdersController < ApplicationController
	def index
		@current_user
		@product=Product.all
		@order =Order.new
	end

	def new

		# if logged_in?
		# 	puts "uid"	
			# puts @current_user.id
		@product=Product.all
		@order = Order.new
	end

	def create
		puts orderProducts['products']
		# reload page
		@product=Product.all
		render :new
	end

	def list
	end

	def orderProducts
		params.permit(:room, :products, :notes)
	end

end