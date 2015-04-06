##
# Lists,Shows and Creates Notifications
class NotificationsController < ApplicationController
  ##   
  # Returns all the Notifications stored in the database
  def index
    @notification = Notification.all
  end
   
  ##   
  # Deletes a specific notification given it's ID and redirects to applications/notify
  def destroy
    @notification = Notification.find(params[:notification_id])
    @notification.destroy
    number = @notification.app_id
    @notification.save
    redirect_to applications_notify_url(:number => number)
  end
   
  ##    
  # Specifies the notifications_params to be user_email , appname and app_id  
  private
  def notifications_params
    params.require(:notification).permit(:user_email, :appname, :app_id)
  end
   
end

