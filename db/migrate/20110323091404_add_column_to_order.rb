class AddColumnToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders,:room_id,:integer
    add_column :orders,:name,:string
    add_column :orders,:contact,:string
    add_column :orders,:phone,:string
    add_column :orders,:email,:string
    add_column :orders,:tel,:string
    add_column :orders,:remark,:string
    add_column :orders,:quantity,:integer
    add_column :orders,:begin_date,:timestamp
    add_column :orders,:end_date,:timestamp
  end

  def self.down
    remove_column :orders,:room_id
    remove_column :orders,:name
    remove_column :orders,:contact
    remove_column :orders,:phone
    remove_column :orders,:email
    remove_column :orders,:remark
    remove_column :orders,:begin_date
    remove_column :orders,:end_date
    remove_column :orders,:tel
  end
end
