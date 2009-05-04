class AddCategoryToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :category, :string
    add_index :links, :category
  end

  def self.down
    remove_column :links, :category
  end
end
