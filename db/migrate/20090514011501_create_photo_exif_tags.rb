class CreatePhotoExifTags < ActiveRecord::Migration
  def self.up
    create_table :photo_exif_tags do |t|
      t.integer :photo_id
      t.string :tag
      t.string :value
      t.timestamps
    end
    
    add_index :photo_exif_tags, :photo_id
    add_index :photo_exif_tags, [ :photo_id, :tag ]
  end

  def self.down
    drop_table :photo_exif_tags
  end
end
