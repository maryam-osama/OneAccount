class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :email
      t.integer :app_id

      t.timestamps
      t.references :user, index: true
    end
  end
end
