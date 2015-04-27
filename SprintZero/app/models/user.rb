class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :purchases
  ##
  # Added relation
  has_one :wishlist
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
         
end
