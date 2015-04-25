class Application < ActiveRecord::Base
  has_many :comments
  validates :appname, presence: true
  validates :description, presence: true
  validates :price, numericality: true, presence:true
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }

  def self.search(query)
    where("appname like ?", "%#{query}%") 
  end

end
