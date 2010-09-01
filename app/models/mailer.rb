class Mailer < ActionMailer::Base
  def contact(contact)
    recipients 'ian.enders@gmail.com'
    from       'contact@addictedtoian.com'
    subject    "addictedTOian Contact from #{contact.name}"
    body       :contact => contact
  end
  
  def comment(comment)
    recipients 'ian.enders@gmail.com'
    from       'comment@addictedtoian.com'
    subject    "addictedTOian Comment from #{comment.user_name}"
    body       :comment => comment
  end
end
