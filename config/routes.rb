Rails.application.routes.draw do
  devise_for :entrepreneurs
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#index'
  get '/join/:id' => 'meetings#join'
  get '/leave/:id' => 'meetings#leave'
  get 'meetings' => 'meetings#new'
  resources :meetings

end
