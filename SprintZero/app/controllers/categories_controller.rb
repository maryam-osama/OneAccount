##
# class that defines methods for perfoming CRUD operations on categories 
class CategoriesController < ApplicationController
  ##
  # defines the new action 
  def new
    @category = Category.new
  end
  
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
      if @category.save
      redirect_to categories_path
      else
      render 'new'
      end
  end
  
  ## 
  # This Method requests a category with specific ID 
  #
  # from the category model.
  #
  # If category with required ID is found, 
  #
  # delete the category
  #
  # and assigns all applications of this category to category others
  def destroy
    @category = Category.find(params[:id])
    @applications = Application.where(:category_name => @category.name)
      @applications.each do |application|
      application.category_name = "Others"
      application.save
    end
    @category.destroy 
    redirect_to categories_path
  end
  
  ##
  # This Method creates the show of the category. 
  #
  # Gets applications which has the same category_name as the category.
  #
  # Lists all the apps of the same category name.
  def show
    @category = Category.find(params[:id])
    @applications = Application.where(:category_name => @category.name)
  end
  
end