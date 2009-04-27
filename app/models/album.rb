class Album < ActiveRecord::Base

  validates_presence_of :name
  has_many :photos, :dependent => :destroy
  
  belongs_to :cover_photo, :class_name => 'Photo'
  
  after_save :save_attachments
    
  def attachable=(params)
    logger.debug "Attachable = #{params.inspect}"
    @attachments = params.keys.sort.inject([]) { |vals, k| vals.push(params[k]) }.reject {|a| a[:uploaded_data].blank? }.collect { |a| Photo.new(a) }
  end
  
  def size
    photos.size
  end
  
  def date
    created_at.strftime('%m/%d/%y')
  end
  
  def cover
    cover_photo ? cover_photo : photos.first
  end

  def cover_photo_url
    return '' if !cover
    cover.public_filename(:gallery_hero)
  end
  
  protected
  def save_attachments
    if @attachments
      logger.debug "Saving attachments"
      @attachments.each do |attachment|
        logger.debug "Appending attachment #{attachment.inspect}"
        photos << attachment
      end
    end
  end
  
end