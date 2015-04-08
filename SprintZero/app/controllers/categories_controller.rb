##
# class that defines methods for perfoming CRUD operations on categories 
class CategoriesController < ApplicationController
  ##
  # defines the new action 
  def new; end
  # retreives categories data and displays them in one page 
  def index
    @categories = Category.all 
  end
  
  ##  
  # method creates a new record with the recieved attribute in the database
  # and saves the record in the model Category
  #
  # it redirects user to the list of categories
  def create
    @category = Category.new(params.require(:category).permit(:name))
    @category.save
    redirect_to categories_path
  end
  # displays details about the selected category 
  def show
    @category = Category.find(params[:id])
  end
  
end