class Album < ActiveRecord::Base

  validates_presence_of :name
  has_many :photos
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
  
  protected
  def save_attachments
    logger.debug "Saving attachments"
    @attachments.each do |attachment|
      logger.debug "Appending attachment #{attachment.inspect}"
      photos << attachment
    end
  end
  
end