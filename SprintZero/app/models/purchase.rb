<<<<<<< HEAD
Purchase = Class.new(ActiveRecord::Base)
=======
class Purchase < ActiveRecord::Base
  belongs_to :application
  belongs_to :user
end 
>>>>>>> Test
