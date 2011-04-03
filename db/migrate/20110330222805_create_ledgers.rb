class CreateLedgers < ActiveRecord::Migration
  def self.up
    create_table :ledgers do |t|
      t.integer :user_id
      t.integer :item_id
      t.float :money_owed
      t.float :money_paid

      t.timestamps
    end
  end

  def self.down
    drop_table :ledgers
  end
end
