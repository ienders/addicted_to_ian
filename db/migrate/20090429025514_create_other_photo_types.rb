class CreateOtherPhotoTypes < ActiveRecord::Migration
  def self.up
    create_table :blog_photos do |t|
      t.column :blog_id,      :integer
      t.column :parent_id,    :integer
      t.column :content_type, :string
      t.column :filename,     :string    
      t.column :thumbnail,    :string 
      t.column :size,         :integer
      t.column :width,        :integer
      t.column :height,       :integer
      t.timestamps
    end

    create_table :link_photos do |t|
      t.column :parent_id,    :integer
      t.column :content_type, :string
      t.column :filename,     :string    
      t.column :thumbnail,    :string 
      t.column :size,         :integer
      t.column :width,        :integer
      t.column :height,       :integer
      t.timestamps
    end
    
    add_column :links, :link_photo_id, :integer
    
    create_table :plug_photos do |t|
      t.column :parent_id,    :integer
      t.column :content_type, :string
      t.column :filename,     :string    
      t.column :thumbnail,    :string 
      t.column :size,         :integer
      t.column :width,        :integer
      t.column :height,       :integer
      t.timestamps
    end
    
    create_table :plugs do |t|
      t.column :plug_photo_id, :integer
      t.column :title,         :string
      t.column :description,   :text
    end
  end

  def self.down
    drop_table :plugs
    drop_table :plug_photos
    remove_column :links, :link_photo_id
    drop_table :link_photos
    drop_table :blog_photos
  end
end