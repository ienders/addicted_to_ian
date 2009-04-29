class Blog < ActiveRecord::Base

  acts_as_taggable
  has_many :blog_photos, :dependent => :destroy
  after_save :save_attachments

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