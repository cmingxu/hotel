class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.decimal :price
      t.decimal :online_price
      t.decimal :price_with_breakfirst
      t.decimal :breakfirst_price
      t.decimal :bed_price
      t.decimal :service_price
      t.integer :quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :rooms
  end
end
