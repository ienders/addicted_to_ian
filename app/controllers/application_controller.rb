class ApplicationController < ActionController::Base
  include TwitterHelper
  
  protect_from_forgery
  
  helper :all
  
end
