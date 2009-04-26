class Photo < ActiveRecord::Base
  
  exif_fu
  
  belongs_to :album
  
  has_attachment(
    :content_type => :image, 
    :storage      => :file_system, 
    :max_size     => 10000.kilobytes,
    :resize_to    => '608>x456',
    :thumbnails   => {
      :thumb        => '62x46>',
      :gallery_hero => 'crop: 100x36'
    }
  )
  
  def thumb_url
    public_filename(:thumb)
  end

  def thumb_width
    Photo.first(:conditions => { :thumbnail => 'thumb', :parent_id => id }).width
  end
  
  def thumb_height
    Photo.first(:conditions => { :thumbnail => 'thumb', :parent_id => id }).height
  end

  validates_as_attachment
  
  protected   
  def resize_image(img, size)
    original_exif = MiniExiftool.new(img.filename)
    if (size.is_a?(String) && size =~ /^crop: (\d*)x(\d*)/i) || (size.is_a?(Array) && size.first.is_a?(String) && size.first =~ /^crop: (\d*)x(\d*)/i)
      img.crop_resized!($1.to_i, $2.to_i)  
      self.temp_path = write_to_temp_file(img.to_blob)  
    else  
      super
    end
      
      
    if size == "608>x456"
      # Copy original exif data into resized image.
      # Do a two pass save if it doesnt work the first time: we remove all attributes which caused the save to fail.
      resized_exif = MiniExiftool.new(self.temp_path)
      MiniExiftool.writable_tags.each do |tag|
        if !original_exif[tag].blank?
          resized_exif[tag] = original_exif[tag]
        end
      end
      if !resized_exif.save
        resized_exif.revert
        MiniExiftool.writable_tags.reject {|t| resized_exif.errors[t] }.each do |tag|
          if !original_exif[tag].blank?
            resized_exif[tag] = original_exif[tag]
          end
        end
        resized_exif.save
      end
    end
  end
  
end