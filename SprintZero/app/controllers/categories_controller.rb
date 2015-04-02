class CategoriesController < ApplicationController
    # defines the new action 
     def new
     end
       def index
    @categories = Category.all 
       end
     # creates a new record with the recieved attribute, saves it in the model
     ## redirects user to the list of categories
     def create
         @category = Category.new(params.require(:category).permit(:name))
          @category.save
  redirect_to categories_path
     end
     def show
         @category = Category.find(params[:id])
     end
end
