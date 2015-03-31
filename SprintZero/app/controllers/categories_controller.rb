class CategoriesController < ApplicationController
     
     def new
     end
       def index
    @categories = Category.all 
       end
       
       def destroy
      
     @category= Category.find(params[:id])
    @category.destroy
    
   
   redirect_to categories_path
   
end

     def create
         @category = Category.new(params.require(:category).permit(:name))
          @category.save
  redirect_to categories_path
     end
     
         
         def show
        @category=Category.find(params[:id])
        @applications = Application.where(:category_name => @category.name)


end

    
end
