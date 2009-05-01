class AddUrlToPlugs < ActiveRecord::Migration
  def self.up
    add_column :plugs, :url, :string
  end

  def self.down
    remove_column :plugs, :url
  end
end
