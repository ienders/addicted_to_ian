ActionController::Routing::Routes.draw do |map|

  # Contact
  map.contact '/contact', :controller => 'contact', :action => 'index'
  
  # About
  map.about '/about', :controller => 'about', :action => 'index'

  # RSS
  map.blog_rss '/rss.xml', :controller => 'blogs', :action => 'rss'

  # Words
  map.resources :blogs
  map.blog_calendar_day '/blogs/search/:by/:year/:month/:day', :controller => 'blogs', :action => 'search'
  map.blog_search '/blogs/search/:by', :controller => 'blogs', :action => 'search'

  # Pictures
  map.pictures '/pictures', :controller => 'pictures'
  map.pictures_album '/pictures/album/:id', :controller => 'pictures', :action => 'album'
  map.pictures_album '/pictures/photo/:id', :controller => 'pictures', :action => 'photo'
  map.resources :albums # For admin only
  map.new_photo_field '/albums/new_photo_field', :controller => 'albums', :action => 'new_photo_field'
  map.resources :photos # For admin only

  # Plugs
  map.resources :plugs

  # Links
  map.link_category '/links/category/:category', :controller => 'links', :action => 'index'
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
# map.connect ':controller/:action/:id.:format'
end
