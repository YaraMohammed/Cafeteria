class CategoriesController < ApplicationController
 
  def index
    @category = Category.all
  end
  def new
    @category = Category.new
  end

  def create
  	@category=Category.create(category_params)
  	
    if @category.save
      redirect_to new_product_path
    else
        render 'new'
    end
  end



def category_params
  params.require(:category).permit(:name)
end

end