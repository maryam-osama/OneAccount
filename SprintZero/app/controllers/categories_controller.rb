class CategoriesController < ApplicationController
  def new; end
  
  ##
  # Gets all availble categories and saves it in a variable to be displayed later 
  
  def index
    @categories = Category.all 
  end
  
  def create
    @category = Category.new(params.require(:category).permit(:name))
    @category.save
    redirect_to categories_path
  end
  
  def show
    @category = Category.find(params[:id])
  end

end
