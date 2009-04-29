class Plug < ActiveRecord::Base
  belongs_to :plug_photo, :dependent => :destroy
  after_save :save_attachments
    
  def attachable=(params)
    @attachments = params.keys.sort.inject([]) { |vals, k| vals.push(params[k]) }.reject {|a| a[:uploaded_data].blank? }.collect { |a| PlugPhoto.new(a) }
  end
  
  protected
  def save_attachments
    plug_photo = @attachments.first if @attachments
    save
  end
end