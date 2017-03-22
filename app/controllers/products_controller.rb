class ProductsController < ApplicationController
 
  def index
    @product = Product.all
  end
  def new
    @product = Product.new
  end

  def create
  	@product=Product.create( product_params	 )
  	if @product.save
  		redirect_to products_path
  	else
      	render 'new'
    end
  end



def product_params
  params.require(:product).permit(:name, :price, :image)
end

end