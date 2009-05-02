class AddTimestampsToPlugs < ActiveRecord::Migration
  def self.up
    add_column :plugs, :created_at, :timestamp, :null => false
    add_column :plugs, :updated_at, :timestamp, :null => false
  end

  def self.down
    remove_column :plugs, :updated_at
    remove_column :plugs, :created_at
  end
end
