  class CreatePurchases < ActiveRecord::Migration
  def change
  create_table :purchases do |t|
  t.string :user_email
  t.integer :app_id
  t.timestamps
  end
  end
  
  end