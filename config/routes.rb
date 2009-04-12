ActionController::Routing::Routes.draw do |map|

  # Words
  map.resources :blogs
  map.blog_calendar_day '/blogs/search/:by/:year/:month/:day', :controller => 'blogs', :action => 'search'
  map.blog_search '/blogs/search/:by', :controller => 'blogs', :action => 'search'

  # Pictures
  map.pictures '/pictures', :controller => 'pictures'

  # Plugs
  map.plugs '/plugs', :controller => 'plugs'

  # Links
  map.resources :links

  # Sessions
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users
  map.resource :session

  map.root :controller => 'blogs'

#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'
end
