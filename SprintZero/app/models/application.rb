class Application < ActiveRecord::Base
   has_many :purchases
   def self.search(query)
   where("appname like ?", "%#{query}%") 
   end
   
end
