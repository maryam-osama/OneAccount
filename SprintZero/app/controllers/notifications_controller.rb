class NotificationsController < ApplicationController
    
    def index
        @notification=Notification.all
    end
    
    def show
        @notification=Notification.find(params[:id])
    end
    
    def new
    @notification = Notification.new
    end
   
    def create
    @notification = Notification.new(notifications_params)
    @notification .save
    end
    
    
 def destroy
      
   @notification= Notification.find(params[:id])
   @notification.destroy
   @notification.save
   if  params[:number] == "0"
   @application=Application.find(params[:appid])
   @application.destroy
   @application.save
   end
   redirect_to notifications_path
   
  end

    
 private
  def notifications_params
    params.require(:notification).permit(:user_email, :appname,:app_id)
  end
    
    
    
    
end

