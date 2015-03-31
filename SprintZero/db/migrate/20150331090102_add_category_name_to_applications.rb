class AddCategoryNameToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :category_name, :string
  end
end
