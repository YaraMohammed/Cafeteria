class CategoriesController < ApplicationController
 
  def index
    @category = Category.all
  end
  def new
    @category = Category.new
  end

  def create
  	@category=Category.create(category_params)
  	if @product.save
      redirect_to products_path
    else
        render 'new'
    end
  end



def category_params
  params.require(:category).permit(:name)
end

end