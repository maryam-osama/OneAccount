## 
#This is class of applications
class ApplicationsController < ApplicationController  
  def new
    @categories = Category.all  
  end


   ## 
    #This method lists all the publisher's app
    #
    #By  checking if the applications model have current_user_Email as a publisher email
    # 
    #Then it loops on these applications
    # and views the appname of this applications
  def myapps
    @applications = Application.where(publisher_email: current_user.email)
  end 
   

  def index
    if params[:search]
    @applications = Application.search(params[:search]).order("created_at DESC")
    end
  end
  # It returns the articles whose titles contain one or more words that form the query

  def show
     @application = Application.find(params[:id])
  end
    
  def notify
     @application = Application.find(params[:number])
     @notification = Notification.find(params[:notification_id])
     @notification.destroy
     @notification.save
  end
    
  ##    
  # Creates a new Notification once the new Application is created   
  def create 
    @application = Application.new(application_params)
    @application.publisher_email  = current_user.email
    
    if @application.save
    @notification = Notification.new
    @notification.user_email = current_user.email
    @notification.appname = @application.appname
    @notification.app_id = @application.id
    @notification.save
    redirect_to @application
    else
    render 'new'
    end
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