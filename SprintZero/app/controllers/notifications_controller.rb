##
# Lists,Shows and Creates Notifications
class NotificationsController < ApplicationController
  ##   
  # Returns all the Notifications stored in the database
  def index
    @notification = Notification.all
  end
   
  ##    
  # Specifies the notifications_params to be user_email , appname and app_id  
  private
  def notifications_params
    params.require(:notification).permit(:user_email, :appname, :app_id)
  end
   
end

