require 'rails_helper'
include Devise::TestHelpers

RSpec.describe PurchasesController, type: :controller do
    
    
    
    let(:user) do
      user = User.new
      user.email = "maryam@gmail.com"
      user.encrypted_password = "1234"
      user.save validate: false
      user
    end
  
  
    
    
    
    it "renders the index view" do
    user
    sign_in(user)
   
    application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11 ,:publisher_email => "maryam@gmail.com")
    purchase = Purchase.create!(:app_id => application.id ,:user_email => "maryam@gmail.com")
    
    get :index
    expect(assigns(:app_names )).to eq([application])
   
  end
    
    
    it "should redirect user to the updated app page " do  
   
    application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11 ,:publisher_email => "maryam@gmail.com")
    purchase = Purchase.create!(:app_id => application.id ,:user_email => "maryam@gmail.com" ,:updated => nil)
    get :updated , number: purchase.id ,url: 'https://github.com'
    
    expect(Purchase.exists?(app_id: application.id , user_email: "maryam@gmail.com" ,updated: true )).to eq(true)
    
  end
  
end

