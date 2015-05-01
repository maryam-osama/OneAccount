##
#This class responsible for the application migration
##
#An application has many comments 
class Application < ActiveRecord::Base
  has_many :comments
  validates :appname, presence: true
  validates :description, presence: true
  validates :price, numericality: true, presence:true
  has_many :comments, dependent: :destroy
  ratyrate_rateable 'Rate'
 
  def self.search(query)
    where("appname like ?", "%#{query}%") 
  end

end