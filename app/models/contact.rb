class Contact < ActiveForm
  attr_accessor :name, :email, :message
  validates_presence_of :name, :message
  validates_format_of(
    :email,
    :with    => Authentication.email_regex,
    :message => Authentication.bad_email_message,
    :if      => Proc.new {|contact| !contact.email.blank? }
  )
end