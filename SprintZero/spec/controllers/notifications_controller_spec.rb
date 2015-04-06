require 'rails_helper'
require 'spec_helper'

RSpec.describe NotificationsController, type: :controller do

    
   describe "GET index" do
    it "assigns @notifications" do
      
      notification = Notification.create!(:appname => 'Viber' ,:user_email => 'maryam@gmail.com')
      get :index
      expect(assigns(:notification )).to eq([notification])
    end
    
    
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    
   end

   it "deletes the notification" do
    notification = Notification.create!(:appname => 'Viber' ,:user_email => 'maryam@gmail.com') 
    expect{
        delete :destroy, notification_id: notification.id , id: notification.id        
    }.to change(Notification,:count).by(-1)
   end

end
