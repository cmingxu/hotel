class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :owner_id
      t.string :owner_type
      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at
    end
  end

  def self.down
    drop_table :images
  end
end
