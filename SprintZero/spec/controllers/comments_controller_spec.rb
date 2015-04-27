require 'rails_helper'
require 'spec_helper'
include Devise::TestHelpers

RSpec.describe CommentsController, type: :controller do
  
  
   let(:user) do
      user = User.new
      user.email = "Khadija@gmail.com"
      user.encrypted_password = "1234"
      user.save validate: false
      user
    end
  
it 'create a new comment with valid attributes' do
      
     user
     sign_in(user)
      
      application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11) 
       post :create, application_id: application.id, comment: {
       :commenter => "Khadija@gmail.com",
       :body => "Good",
       :application_id => 1 }
       expect(Comment.exists?(id: 1)).to eq(true)
   
    end
    
    
    it "deletes the comment" do
    
    application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11)
    comment = application.comments.create(:commenter => ' BasmaElGeziry@gmail.com' , :body => 'Perfect')
   
    expect{
      delete :destroy, id: comment.id , application_id: application        
    }.to change(Comment,:count).by(-1)
    
  end
     
 end



