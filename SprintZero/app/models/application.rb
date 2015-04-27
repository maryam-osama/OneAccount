class Application < ActiveRecord::Base
  validates :appname, presence: true
  validates :description, presence: true
  validates :price, numericality: true, presence:true
  ##
  # Added relation
  belongs_to :wishlist   
  def self.search(query)
    where("appname like ?", "%#{query}%") 
  end

end
