class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.float :price
      t.boolean :paid
      t.integer :user_id
      t.integer :bill_id

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
