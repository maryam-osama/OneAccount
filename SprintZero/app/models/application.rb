
class Application < ActiveRecord::Base
	
def self.search(query)
   where("appname like ?", "%#{query}%") 
   end
   
has_many :purchases
   
end
