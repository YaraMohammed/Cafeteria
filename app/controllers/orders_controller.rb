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
		@product=Product.where("status = true")
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
		 @product=Product.where("status = true")
		 # redirect_to :new
		 render :new
		end
	end
	#List admin orders page
	def list
		@orders= Order.all
		@orderdata=[]
		puts "++++++++++++++++++++++++++++++++++"
		if @current_user.id == 1
			@orders.each { |order| 
				 # puts order.created_at
				@user=User.find(order.user_id)
				@orderdata << {"oid" => order.id, "odate" => order.created_at,"ostatus" => order.status,"uname" => @user.name ,"uroom" => @user.room,"uext" => @user.ext_room}
			}
			render 'list'
		else
			# List user My order page
			
			@orders.each { |order| 
				@amount=0
				@order_products_ids=OrderProduct.find_by_sql("SELECT * FROM order_products WHERE order_id = "+order.id.to_s)
				@order_products_ids.each{ |op|
					@pprice=Product.select(:price).where(id: op.product_id)
					@amount+=@pprice[0].price*op.quantity
				}
				@orderdata << {"oid" => order.id, "odate" => order.created_at,"ostatus" => order.status,"oamount" => @amount}
			}
			render 'myorders'

		end

	end

	# delet order page
	def destroy
		@order=Order.find(params[:oid])
    	@order.destroy
    	redirect_to 'list'
  	end



	#change order status
	def deliver
		puts "+++++++++++++oid++++++++++++++"
		puts params[:oid]
		@order = Order.find(params[:oid])
		@order.update(status: "out for delivery")
		puts "+++++++++++++oid++++++++++++++"
		redirect_to 'list'
	end

	#display order products
	def orderproductlist
		puts "+++++++++++++oid++++++++++++++"
		@orderproductsids=OrderProduct.find_by_sql("SELECT * FROM order_products WHERE order_id = "+orderidfromlist["oid"])
		puts @orderproductsids.inspect
		@orderproducts=[]
		@orderproductsids.each{ |op|
			@product=Product.find(op.product_id)
			@orderproducts << {"quantity" => op.quantity, "pimg" => @product.image.url(:thumb), "pname" => @product.name, "pprice" => @product.price}
		}
		puts "+++++++++++++++++++++++full++++++++++++++++++++++++++"
		puts @orderproducts.inspect
		render :json => @orderproducts
	end

	#filter user orders by date
	# def datefilter
		
	# end

	def orderProducts
		params.permit(:room, :products, :notes, :usr)
	end
	def orderidfromlist
		params.permit(:oid)
	end

def logged
	notlogged
end
end