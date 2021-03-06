require 'rails_helper'

RSpec.feature "Applications", type: :feature do
    
    let(:user) do
      user = User.new
      user.email = "maryam@gmail.com"
      user.encrypted_password = "1234"
      user.save validate: false
      user
    end

    describe "the rating_for process", :type => :feature do
    
    before :each do
     user
     sign_in(user)
     application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11 ,:publisher_email => "maryam@gmail.com")
    end    
    
   
end
end
