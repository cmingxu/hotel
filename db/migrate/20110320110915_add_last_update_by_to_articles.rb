class AddLastUpdateByToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles,:last_edit_by,:integer
  end

  def self.down
    remove_column :articles,:last_edit_by
  end
end
