require 'rails_helper'
require 'spec_helper'

RSpec.describe Notification, type: :model do
    
   

   it "is valid with a appname , desription and price" do
      application = Application.new(
         appname: 'Viber',
         description: 'Good',
         price: 11  )
        expect(application).to be_valid
   end
   
   
    it "is invalid without a Appname" do
     application = Application.new(appname: nil ,description: 'Good' ,price: 11)
     application.valid?
     expect(application.errors[:appname]).to include("can't be blank")
   end
   
   
   it "is invalid without a Description" do
     application = Application.new(appname:'Viber' ,description: nil ,price: 11)
     application.valid?
     expect(application.errors[:description]).to include("can't be blank")
   end
   
   
   it "is invalid without a Price" do
     application = Application.new(appname: 'Viber' ,description: 'Good' ,price: nil)
     application.valid?
     expect(application.errors[:price]).to include("can't be blank")
   end
   
   it "is invalid without an Numerical Price" do
     application = Application.new(appname: 'Viber' ,description: 'Good' ,price: 'abc')
     application.valid?
     expect(application.errors[:price]).to include("is not a number")
   end
   
  
  
 
  
 
 end