class RemoveUserTypeFrom < ActiveRecord::Migration
  def self.up
    remove_column :users,:user_type
  end

  def self.down
    add_column :users,:user_type,:integer
  end
end
