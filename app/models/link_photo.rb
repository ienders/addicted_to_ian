class LinkPhoto < ActiveRecord::Base
  has_attachment(
    :content_type => :image, 
    :storage      => :file_system, 
    :max_size     => 10000.kilobytes,
    :resize_to    => '608>x456',
    :thumbnails   => { :thumb => '' }
  )
  
  validates_as_attachment
end