class AddCanOrderToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms,:can_order,:boolean
  end

  def self.down
    remove_column :rooms,:can_order
  end
end
