ActionController::Routing::Routes.draw do |map|
  map.resources :pages,:only => [:show]

  map.resources :orders

  map.resources :rooms

  map.resources :articles

  map.namespace :admin do |admin|
    admin.resources :pages,:except => [:destroy]

    admin.resources :images
    admin.resources :categories
    admin.resources :articles,:member => {:publish => :put,:hide => :put}
    admin.resources :users,:member => {:make_admin => :put }
  end


  map.resources :images,:only => [:destroy]

  map.namespace :category do |c| 
  end


  map.devise_for :users

  map.resources :kindeditor,:except => :all,:member => {:upload => :post},:collection => {:images_list => :get}

  map.resources :users,:only => [:show,:update]#,:member => {:change_login => :put,:change_avatar => :put}
  #devise_scope :user do
  #    get "sign_in", :to => "devise/sessions#new"
  #end

  map.dashboard '/home',:controller => "users",:action => "home"
  map.search '/search',:controller => "welcome",:action => "search"
  map.admin_search '/admin_search',:controller => "/admin/base",:action => "admin_search"

  map.admin '/admin',:controller => "admin/base", :action => "index"
  map.root :controller => "welcome"
  map.reset_session 'reset_session',:controller => "welcome",:action => "reset_session"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
