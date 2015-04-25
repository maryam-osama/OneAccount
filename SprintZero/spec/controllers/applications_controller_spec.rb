require 'rails_helper'
require 'spec_helper'
include Devise::TestHelpers

RSpec.describe ApplicationsController, type: :controller do
 
 
  let(:user) do
      user = User.new
      user.email = "maryam@gmail.com"
      user.encrypted_password = "1234"
      user.save validate: false
      user
    end
  
  
   
   
   describe "GET index" do
    it "assigns @applications" do
      
      application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11)   
      get :index , search: application.appname
      expect(assigns(:applications )).to eq([application])
    end
    
    
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    
end

 
 describe "GET show" do
 
  
  it "renders the #show view" do
    application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11)   
    get :show, id: application.id
    expect(response).to render_template("show")
   
  end
  
end

  describe "GET new" do
   it 'assigns a new application to @application' do
    get :new
    expect(assigns(:application)).to be_a_new(Application)

  end
  
 end
 
 
 it "should create application" do
     user
     sign_in(user)
     post :create, application: {
      :appname => "Viber",
      :description => "Good",
      :category_name => "Finance",
      :price => 11}
    expect(Application.exists?(appname: "Viber")).to eq(true)
    expect(Notification.exists?(id: 1 )).to eq(true)
 
  end
  
  it "deletes the application" do
   application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11)   
    expect{
      delete :destroy, id: application.id        
    }.to change(Application,:count).by(-1)
  end
  
   it "renders the #myapps view" do
    user
    sign_in(user)
    application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11 ,:publisher_email => "maryam@gmail.com")
    
    get :myapps
    expect(assigns(:applications )).to eq([application])
   
  end
  
  describe "GET notify" do
  it "renders the #notify view" do
    application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11)
   # notification = Notification.create!(:appname => 'Viber' ,:user_email => 'maryam@gmail.com')
   
    get :notify, number: application.id #, notification_id: 1
    expect(response).to render_template("notify")
   
  end
   
end

it "Should notify users with an app update " do
    
    application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11 ,:publisher_email => "maryam@gmail.com")
    purchase = Purchase.create!(:app_id => application.id ,:user_email => "maryam@gmail.com" ,:updated => nil)
    get :updates , app: application.id
    
    expect(Purchase.exists?(app_id: application.id , user_email: "maryam@gmail.com" ,updated: false )).to eq(true)
    
  end

end
