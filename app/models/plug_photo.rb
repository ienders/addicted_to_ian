class PlugPhoto < ActiveRecord::Base
  has_attachment(
    :content_type => :image, 
    :storage      => :file_system, 
    :max_size     => 10000.kilobytes,
    :resize_to    => '500x300',
    :thumbnails   => { :thumb => '233x140' }
  )
  
  validates_as_attachment
end