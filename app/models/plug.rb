# == Schema Information
# Schema version: 20090501023904
#
# Table name: plugs
#
#  id            :integer(4)      not null, primary key
#  plug_photo_id :integer(4)
#  title         :string(255)
#  description   :text
#  url           :string(255)
#

class Plug < ActiveRecord::Base
  belongs_to :plug_photo, :dependent => :destroy
  after_create :save_attachments
    
  def attachable=(params)
    @attachments = params.keys.sort.inject([]) { |vals, k| vals.push(params[k]) }.reject {|a| a[:uploaded_data].blank? }.collect { |a| PlugPhoto.new(a) }
  end
  
  protected
  def save_attachments
    if @attachments
      @attachments.first.save
      update_attribute(:plug_photo_id, @attachments.first.id)
    end
  end
end
