require 'rails_helper'
require 'spec_helper'

RSpec.describe Notification, type: :model do
   it "is valid with a user email and appname" do
      notification = Notification.new(
        appname: 'Viber',
        user_email: 'maryam@gmail.com')
        expect(notification).to be_valid
   end
   
end   


