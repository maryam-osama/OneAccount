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


end
