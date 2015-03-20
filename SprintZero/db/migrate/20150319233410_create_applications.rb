class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :appname
      t.text :description
      t.integer :price
      t.string :publisher_email

      t.timestamps null: false
    end
  end
end
