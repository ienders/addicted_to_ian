class ContactController < ApplicationController
  
  def index
    if request.post?
      @contact = Contact.new(params[:contact])
      if @contact.valid?
        flash[:message] = 'Your message has been sent.  Sweetness.'
        redirect_to :action => 'index'
      else
        flash[:warning] = "Dang, you didn't fill out the boxes right."
      end
    end
  end

end
