AddictedToIan::Application.routes.draw do

  devise_for :users

  match '/contact' => 'contact#index', :as => :contact
  match '/about' => 'about#index', :as => :about
  match '/resume' => 'about#resume', :as => :resume
  match '/rss.xml' => 'blogs#rss', :as => :blog_rss

  resources :blogs do |blogs|
    collection do
      get :tweets
    end
  end

  resources :blog_photos

  match '/blogs/search/:by/:year/:month/:day' => 'blogs#search', :as => :blog_calendar_day
  match '/blogs/search/:by' => 'blogs#search', :as => :blog_search
  match '/blog/new_photo_field' => 'blogs#new_photo_field', :as => :blog_new_photo_field
  match '/pictures' => 'pictures#index', :as => :pictures
  match '/pictures/album/:id' => 'pictures#album', :as => :pictures_album
  match '/pictures/photo/:id' => 'pictures#photo', :as => :pictures_album

  resources :albums

  match '/albums/new_photo_field' => 'albums#new_photo_field', :as => :new_photo_field

  resources :photos
  resources :plugs

  match '/links/category/:category' => 'links#index', :as => :link_category

  resources :links

  root :to => 'blogs#index'

end
