class Link < ActiveRecord::Base
  belongs_to :link_photo, :dependent => :destroy  
  after_save :save_attachments
    
  def attachable=(params)
    @attachments = params.keys.sort.inject([]) { |vals, k| vals.push(params[k]) }.reject {|a| a[:uploaded_data].blank? }.collect { |a| LinkPhoto.new(a) }
  end
  
  protected
  def save_attachments
    link_photo = @attachments.first if @attachments
    save
  end
end
