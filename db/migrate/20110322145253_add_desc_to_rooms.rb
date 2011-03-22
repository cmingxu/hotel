class AddDescToRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms,:desc,:text
  end

  def self.down
    remove_column :rooms,:desc
  end
end
