class ProductsController < ApplicationController
  before_action :logged
  before_action :product_data, only:[:edit, :update,:destroy]
  def index
    @product = Product.all
  end
  def new
    @product = Product.new
  end

  def create
  	@category=Category.find product_params[:category_id]
  	@product=@category.products.create(product_params)
  	if @product.save
  		redirect_to products_path
  	else
      	render 'new'
    end
  end
  def edit
    
  end

  def update
    
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    
    @product.destroy
    redirect_to products_path
  end



def product_params
  params.require(:product).permit(:name, :price,:category_id, :image)
end

def product_data
	@product = Product.find(params[:id])
end
def logged
  notlogged
end

end