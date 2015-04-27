require 'rails_helper'
require 'spec_helper'

RSpec.describe CommentsController, type: :controller do
    
    it "deletes the comment" do
    
    application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11)
    comment = application.comments.create(:commenter => ' BasmaElGeziry@gmail.com' , :body => 'Perfect')
   
    expect{
      delete :destroy, id: comment.id , application_id: application        
    }.to change(Comment,:count).by(-1)
    
  end
   
end     
    