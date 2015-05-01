class AddAppstoreUrlToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :appstore_url, :string
  end
end
