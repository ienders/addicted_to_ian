class RemoveLinks < ActiveRecord::Migration
  def self.up
    drop_table :links
    drop_table :link_photos
  end

  def self.down
  end
end
