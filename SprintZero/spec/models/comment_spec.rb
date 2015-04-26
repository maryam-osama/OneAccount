require 'rails_helper'
require 'spec_helper'


RSpec.describe Comment, type: :model do
    
    
   it "is valid with a body and commenter" do
      comment = Comment.new(
      commenter: "Khadija@gmail.com",
      body: "Good" )
      expect(comment).to be_valid
   end
   
  
end   

