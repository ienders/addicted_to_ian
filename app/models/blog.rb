# == Schema Information
# Schema version: 20090501023904
#
# Table name: blogs
#
#  id         :integer(4)      not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Blog < ActiveRecord::Base

  acts_as_taggable
  has_many :blog_photos, :dependent => :destroy
  after_save :save_attachments

  def photo_by_filename(filename)
    blog_photos.each do |blog_photo|
      return blog_photo if blog_photo.filename == filename
    end
    nil
  end

  def next
    self.class.first(:conditions => [ 'created_at > ?', created_at ], :order => 'created_at ASC')
  end
  
  def previous
    self.class.first(:conditions => [ 'created_at < ?', created_at ], :order => 'created_at DESC')
  end
  
  def self.for_month(year, month)
    start_time = DateTime.civil(year, month)
    end_time   = DateTime.civil(year, month, days_in_month(year, month), 23, 59, 59)
    all(:conditions => [ 'created_at > ? AND created_at < ?', start_time, end_time ] )
  end
  
  def self.for_day(year, month, day)
    start_time = DateTime.civil(year, month, day)
    end_time   = DateTime.civil(year, month, day, 23, 59, 59)
    all(:conditions => [ 'created_at > ? AND created_at < ?', start_time, end_time ] )
  end
  
  def attachable=(params)
    @attachments = params.keys.sort.inject([]) { |vals, k| vals.push(params[k]) }.reject {|a| a[:uploaded_data].blank? }.collect { |a| BlogPhoto.new(a) }
  end
  
  def image_replaced_content
    content.gsub(/#\{img:\s*(.*)\s+(\S*)\}/) do |match|
      logger.debug("matched = #{match}, #{$1}, #{$2}")      
      if !(photo = photo_by_filename($1))
        ''
      else
        "<p style = \"text-align: #{$2}\"><img src = \"#{photo.public_filename}\"  style = \"float: none\" /></p>"
      end
    end
  end
  
  protected
  def self.days_in_month(year, month)
    (Date.new(year, 12, 31) << (12-month)).day
  end
  
  def save_attachments
    if @attachments
      @attachments.each do |attachment|
        blog_photos << attachment
      end
    end
  end

end
