require 'rdiscount'

module ApplicationHelper
  
  include TagsHelper
  
  def markdown(text)
    RDiscount.new(text).to_html
  end
  
end
