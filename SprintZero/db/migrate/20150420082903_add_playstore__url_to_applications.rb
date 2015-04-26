class AddPlaystoreUrlToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :playstore_url, :string
  end
end
