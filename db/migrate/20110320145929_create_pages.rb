class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.text :content
      t.string :meta
      t.string :description
      t.string :slug

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
