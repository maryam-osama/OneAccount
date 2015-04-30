require 'rails_helper'

RSpec.describe Rate, type: :model do
    context "with 2 or more ratings" do 
        it "rates" do 
      application = Application.create!(:appname => 'Viber' ,:description => 'Good' ,:price => 11)   
          rating1 = application.rates.create!(:stars => 3)
          rating2 = application.rates.create!(:stars => 5)
          expect(application.reload.rates).to eq ([rating1,rating2])
        end
 end
 end