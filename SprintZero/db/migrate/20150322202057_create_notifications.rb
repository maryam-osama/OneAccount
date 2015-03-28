class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :user_email
      t.string :appname

      t.timestamps
    end
  end
end
