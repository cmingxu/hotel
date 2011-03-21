class AddLockToUsers < ActiveRecord::Migration
  def self.up
    add_column :users,:lock,:boolean
  end

  def self.down
    remove_column :users,:lock
  end
end
