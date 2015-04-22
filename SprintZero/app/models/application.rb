class Application < ActiveRecord::Base
  has_many :comments
  validates :appname, presence: true
  validates :description, presence: true
  validates :price, numericality: true, presence:true
                 
  def self.search(query)
    where("appname like ?", "%#{query}%") 
  end

end
