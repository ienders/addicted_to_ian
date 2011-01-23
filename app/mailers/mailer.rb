class Mailer < ActionMailer::Base
  
  default :sender => 'system@addictedtoian.com',
          :to     => 'ian.enders@gmail.com'
  
  def contact(contact)
    @contact = contact
    mail :subject => "addictedTOian Contact from #{contact.name}"
  end
  
end
