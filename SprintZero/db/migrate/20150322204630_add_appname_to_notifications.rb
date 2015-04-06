class AddAppnameToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :app_id, :Integer
  end
end
