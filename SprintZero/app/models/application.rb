class Application < ActiveRecord::Base
  validates :appname, presence: true
  validates :description, presence: true
  validates :price, numericality: true, presence:true
  ratyrate_rateable 'Rate'
  
  def self.search(query)
    where("appname like ?", "%#{query}%") 
  end

end
