class AddWindowsUrlToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :windows_url, :string
  end
end
