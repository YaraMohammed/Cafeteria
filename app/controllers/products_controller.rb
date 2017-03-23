class ProductsController < ApplicationController
 
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
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
 
    redirect_to products_path
  end



def product_params
  params.require(:product).permit(:name, :price,:category_id, :image)
end

end