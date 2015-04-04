## 
# Notification migration in the database
class CreateNotifications < ActiveRecord::Migration
  ##  
  # Lists each Notification model attribute and it's type
  #
  # Allows changes to be made in the structure/defination of the model
  def change
    create_table :notifications do |t|
      t.string :user_email
      t.string :appname

      t.timestamps
    end
  end
  
end
