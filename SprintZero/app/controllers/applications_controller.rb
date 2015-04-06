class ApplicationsController < ApplicationController

  def new; end
    
  def index
    if params[:search]
      @applications = Application.search(params[:search]).order("created_at DESC")
    end
  end
   
  # It returns the articles whose titles contain one or more words that form the query
  def show
    @application = Application.find(params[:id])
  end
    
  ##    
  # Creates a new Notification once the new Application is created   
  def create 
    @application = Application.new(application_params)
    @application.publisher_email  = current_user.email
    @application.save
    @notification = Notification.new
    @notification.user_email = current_user.email
    @notification.appname = @application.appname
    @notification.app_id = @application.id
    @notification.save
    redirect_to @application
  end
    
  ##
  # This method requests an application with an id
  # from application model
  #
  # If application with required id is found,
  # delete app
  # 
  # Go back to the homepage
  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    @application.save
    redirect_to welcome_homepage_url
  end 
  
  private
  def application_params
    params.require(:application).permit(:appname, :description, :price)
  end
     
end
    
    
    
 
  
