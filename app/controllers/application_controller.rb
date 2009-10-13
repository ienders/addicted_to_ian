class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include TwitterHelper
  
  helper :all

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '69040ec1df2d2874be7fd1802ffbea73'

  filter_parameter_logging :password
end
