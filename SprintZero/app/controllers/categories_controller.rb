##
# This class represents the categories class.
class CategoriesController < ApplicationController
    def new; end
    
    def index
      @categories = Category.all 
    end
   
    ##
    # This Method requests a category with specific ID 
    # from the category model.
    #
    # If category with required ID is found, 
    # delete the category.
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to categories_path
    end
    
    def create
      @category = Category.new(params.require(:category).permit(:name))
      @category.save
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