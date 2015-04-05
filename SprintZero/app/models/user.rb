class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :purchases
  devise :database_authenticatable, :registerable,
<<<<<<< HEAD
         
=======

>>>>>>> Test
  :recoverable, :rememberable, :trackable, :validatable
         
end
