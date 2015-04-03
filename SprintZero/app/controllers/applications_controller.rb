class ApplicationsController < ApplicationController
  def new; end
    
  def index
    if params[:search]
    @applications = Application.search(params[:search]).order("created_at DESC")
    end
  end
 
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
    
  private
  def application_params
    params.require(:application).permit(:appname, :description, :price)
  end
  
end
    
    

