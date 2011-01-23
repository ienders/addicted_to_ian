class ContactController < ApplicationController
  
  def index
    if request.post?
      @contact = Contact.new(params[:contact])
      if @contact.valid?
        Mailer.contact(@contact)
        render :update do |page|
          page << "$('#error').fadeOut(function() {
            $('#success').fadeIn();
          })"
        end
      else
        render :update do |page|
          page << "$('#error').html('#{h(@contact.error_message)}')"
          page << "$('#success').fadeOut(function() {
            $('#error').fadeIn();
          })"
        end
      end
    end
  end

end