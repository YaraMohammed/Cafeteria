class OrdersController < ApplicationController
	require 'json'	
	before_action :logged
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
		puts "-----------------Save Order---------------"
		@oproducts=JSON.parse orderProducts['products']
		# puts @oproducts[0]["id"]
		# puts @oproducts.class
		if @current_user.id != 1
			@user = User.find(@current_user.id)
		else
			# __TODO__Get userid from select list
		end

		@order = Order.create(notes: orderProducts['notes'], room: orderProducts['room'],user_id: @current_user.id)
		
		if @order.save
			if @oproducts != nil
			@oproducts.each{ |oprod|
				@order_products=OrderProduct.create(order: @order, product_id: oprod["id"], quantity: oprod["quantity"])
			}
			end

		# reload page
		 @product=Product.all
		render :new
		end
	end

	def list
	end

	def orderProducts
		params.permit(:room, :products, :notes)
	end
def logged
	notlogged
end
end