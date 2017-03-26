class OrdersController < ApplicationController
	def index
		@product=Product.all
		@order =Order.new
	end

	def new
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