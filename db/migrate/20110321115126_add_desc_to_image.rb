class AddDescToImage < ActiveRecord::Migration
  def self.up
    add_column :images ,:desc,:string
  end

  def self.down
    remove_column :images,:desc
  end
end
