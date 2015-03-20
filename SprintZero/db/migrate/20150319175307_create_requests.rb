class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :user_email
      t.integer :user_id
      t.text :reason
      t.boolean :accept

      t.timestamps null: false
    end
  end
end
