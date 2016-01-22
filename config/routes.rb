Prelaunchr::Application.routes.draw do

  get 'preference' => 'preference#new'
  post 'preference/create' => 'preference#create'

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "users#new"

  post 'users/create' => 'users#create'
  get 'refer-a-friend' => 'users#refer'
  get 'privacy-policy' => 'users#policy'
  get 'update' => 'users#update'

  unless Rails.application.config.consider_all_requests_local
    get '*not_found', to: 'users#redirect', :format => false
  end
end
