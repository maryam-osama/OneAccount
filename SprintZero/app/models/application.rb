class Application < ActiveRecord::Base
  
   
                    
  def self.search(query)
    where("appname like ?", "%#{query}%") 
  end

end
