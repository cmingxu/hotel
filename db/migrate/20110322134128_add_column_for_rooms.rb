class AddColumnForRooms < ActiveRecord::Migration
  def self.up
    add_column :rooms,:name,:string
    add_column :rooms,:cate,:string
  end

  def self.down
    remove_column :rooms,:name
    remove_column :rooms,:cate
  end
end
