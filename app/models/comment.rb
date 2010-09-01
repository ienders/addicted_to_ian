class Comment < ActiveRecord::Base

  validates_presence_of :user_name, :content, :email
  validates_format_of :email, :with => Authentication.email_regex, :message => Authentication.bad_email_message, :if => Proc.new {|comment| !comment.email.blank? }

  belongs_to :blog
  
end
