class OrdersController < ApplicationController
	require 'json'	
	before_action :logged
	# def index
	# 	@current_user
	# 	@product=Product.all
	# 	@order =Order.new
	# end

	def new

		# if logged_in?
		# 	puts "uid"	
			# puts @current_user.id
		@product=Product.all
		@order = Order.new
	end

	def create
		puts "-----------------Save Order---------------"
		puts orderProducts
		@oproducts=JSON.parse orderProducts['products']
		if @current_user.id != 1
			# @user = User.find(@current_user.id)
			@ouser = @current_user.id
		else
			@ouser = orderProducts['usr']
		end

		@order = Order.create(notes: orderProducts['notes'], room: orderProducts['room'],user_id: @ouser,status:"Processing")
		
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
		puts "++++++++++++++++++++++++++++++++++"
		if @current_user.id != 1
			@orders= Order.all
			# puts "+++++++++++++Orders++++++++++++++"
			# @orders.inspect
			# puts @orders.class
			# @orderproducts=OrderProduct.all
			@users=User.all
			@products =Product.all
			@orderdata=[]
			@orderproducts=[]
			@orders.each { |order| 
				 # puts order.created_at
				@user=User.find(order.user_id)

				@orderdata << {"oid" => order.id, "odate" => order.created_at,"uname" => @user.name ,"uroom" => @user.room,"uext" => @user.ext_room}
				# @orderproductsids=OrderProduct.find_by_order_id(order.id)
				# @orderproductsids=OrderProduct.connection.select_all("SELECT * FROM order_products WHERE order_id = "+order.id.to_s)
				@orderproductsids=OrderProduct.find_by_sql("SELECT * FROM order_products WHERE order_id = "+order.id.to_s)
				# puts "+++++++++++++orderproductsids++++++++++++++"
				# puts @orderproductsids.inspect
				# @orderproducts << {"oid" => order.id}
				# @orderproductsids.each { |product|
				# 	@product =Product.find(product.product_id)
				# 	@orderproducts << @product
				# }
				# @user.inspect

			}
			# puts "+++++++++++++orderdata++++++++++++++"
			# puts @orderdata.inspect
			# puts "+++++++++++++orderproducts++++++++++++++"
			# puts @orderproducts.inspect

			render 'list'
		end

	end
	def deliver
		puts "+++++++++++++oid++++++++++++++"
		puts params[:oid]
		@order = Order.find(params[:oid])
		@order.update(status: "out for delivery")
		puts "+++++++++++++oid++++++++++++++"
		redirect_to 'list'
	end

	def orderProducts
		params.permit(:room, :products, :notes, :usr)
	end
def logged
	notlogged
end
end