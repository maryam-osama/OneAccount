class AddUpdatedToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :updated, :boolean
  end
end
