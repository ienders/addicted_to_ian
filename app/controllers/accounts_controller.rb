class AccountsController < ApplicationController
  
  before_filter { page_title 'Account' }

  def new
  end

  def create
    logger.debug "Authenticating"
    self.current_user = User.authenticate(params[:login], params[:password])
    logger.debug "Loged in? #{logged_in?}"
    if logged_in?
      redirect_back_or_default('/')
      flash[:message] = "Logged in successfully"
    else
      if request.post?
        flash[:warning] = "Please try again, your username and/or password were not found."
      end
      render :action => 'new'
    end
  end

  def destroy
    reset_session
    flash[:message] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
