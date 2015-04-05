class Application < ActiveRecord::Base
<<<<<<< HEAD
  def self.search(query)
    where("appname like ?", "%#{query}%") 
  end
   
end
=======
  
  def self.search(query)
    where("appname like ?", "%#{query}%") 
  end

end
>>>>>>> Test
