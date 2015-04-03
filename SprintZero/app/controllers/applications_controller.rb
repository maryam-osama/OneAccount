class ApplicationsController < ApplicationController
    
    
    
    def new 
    end
    
   def index

   if params[:search]
    @applications = Application.search(params[:search]).order("created_at DESC")
   end
  end
  # It returns the articles whose titles contain one or more words that form the query



##
#This Method requests an application with a specific id
#
#If applications with the required id is found
#
#delete app
#
#go back to homepage
    def destroy
        
  @Applications = Application.find(params[:id])
  @Applications.destroy
  @Applications.save
  redirect_to welcome_homepage_url
end


    def show
    @application = Application.find(params[:id])
    end
    
    def create 
        @application = Application.new(application_params)
        @application.save
        
        @application.publisher_email  = current_user.email
        @application.save
        redirect_to @application
    end
    
    private
     def application_params
    params.require(:application).permit(:appname, :description, :price)
     end
end
    
    

