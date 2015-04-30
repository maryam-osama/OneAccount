require 'rails_helper'
require 'spec_helper'
include Devise::TestHelpers

RSpec.describe WishlistsController, type: :controller do
    
    let(:user) do
      user = User.new
      user.email = "maryam@gmail.com"
      user.encrypted_password = "1234"
      user.save validate: false
      user
    end
    
    describe "GET new" do
        
   it 'assigns a new wishlist to @wishlist' do
    user
    sign_in(user)
    application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11)    
    expect{
      get :new , app_id: application.id     
    }.to change(Wishlist,:count).by(1)

  end
  end
  
it "renders the #show view" do
    user
    sign_in(user)
    application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11)    
    wishlist = Wishlist.create!(:email => 'maryam@gmail.com' ,:app_id => application.id ,:user_id => 1)   
    get :show
    expect(response).to render_template("show")
   
  end
  
  it "deletes the wishlist" do
    application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11)    
    wishlist = Wishlist.create!(:email => 'maryam@gmail.com' ,:app_id => application.id ,:user_id => 1)     
    expect{
      delete :destroy, id: wishlist.id        
    }.to change(Wishlist,:count).by(-1)
    
  end 
end