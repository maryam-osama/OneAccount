class Wishlist < ActiveRecord::Base
    ##
  # Added relation
  belongs_to :user
  has_and_belongs_to_many :application
  
end
