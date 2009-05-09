class Mailer < ActionMailer::Base
  def contact(contact)
    recipients 'ian.enders@gmail.com'
    from       'contact@addictedtoian.com'
    subject    "addictedTOian Contact from #{contact.name}"
    body       :contact => contact
  end
end
