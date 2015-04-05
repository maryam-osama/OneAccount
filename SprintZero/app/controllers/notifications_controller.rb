##
# Lists,Shows and Creates Notifications
class NotificationsController < ApplicationController
  ##   
  # Returns all the Notifications stored in the database
  def index
    @notification = Notification.all
  end
    
  ##    
  # Returns a specific Notification from the database by supplying the id  
  def show
    @notification = Notification.find(params[:id])
  end

  ##
  # Creates new instance of Notification model    
  def new
    @notification = Notification.new
  end
    
  ##   
  # Assigns paramters to a newly created Notification and saves it in the database   
  def create
    @notification = Notification.new(notifications_params)
    @notification.save
  end
    
  ##    
  # Specifies the notifications_params to be user_email , appname and app_id  
  private
  def notifications_params
    params.require(:notification).permit(:user_email, :appname, :app_id)
  end
   
end

