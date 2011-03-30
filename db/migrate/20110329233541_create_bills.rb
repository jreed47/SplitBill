class CreateBills < ActiveRecord::Migration
  def self.up
    create_table :bills do |t|
      t.string :name
      t.string :receipt_loc
      t.datetime :event_time
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bills
  end
end
