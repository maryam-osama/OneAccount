require 'rails_helper'

RSpec.describe Wishlist, type: :model do
    
 it "is valid with a email , app_id , user_id " do
      wishlist = Wishlist.new(
         email: 'rawan@gmail.com',
         app_id: 1,
         user_id: 1 )
        expect(wishlist).to be_valid
     
   end
 
 
 
end