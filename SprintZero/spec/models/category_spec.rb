require 'rails_helper'
require 'spec_helper'

RSpec.describe Category, type: :model do
    
   it "is valid with a name " do
      category = Category.new(
         name: 'Finance')
        expect(category).to be_valid
   end
   
   
   it "is invalid without a name" do
     category = Category.new(name: nil)
     category.valid?
     expect(category.errors[:name]).to include("can't be blank")
   end
   
   
 end