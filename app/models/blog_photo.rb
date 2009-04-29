class BlogPhoto < ActiveRecord::Base
  belongs_to :blog
  
  has_attachment(
    :content_type => :image, 
    :storage      => :file_system, 
    :max_size     => 10000.kilobytes,
    :resize_to    => '608>x456'
  )
  
  validates_as_attachment
end