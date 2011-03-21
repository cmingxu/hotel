class AddJifenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users,:points,:integer
    add_column :users,:credits,:decimal,:precision => 10,:scale => 2
    add_column :users,:invites,:integer
    add_column :users,:user_type,:integer
  end

  def self.down
    remove_column :users,:points
    remove_column :users,:credits
    remove_column :users,:invites
    remove_column :users,:user_type
  end
end
