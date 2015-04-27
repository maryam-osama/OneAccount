##
# This class is for comments migration in the database
class Comment < ActiveRecord::Base
  belongs_to :application
end
