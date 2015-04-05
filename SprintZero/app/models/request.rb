class Request < ActiveRecord::Base
  validates :reason, presence: true,
  length: { minimum: 10 }
end