Rails.application.routes.draw do
  devise_for :entrepreneurs
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'meetings#next'
  get '/join/:id' => 'meetings#join'
  get '/leave/:id' => 'meetings#leave'
  get 'meetings/next' => 'meetings#next'
  get 'meetings' => 'meetings#new'
  get 'meetings/add' => 'meetings#add'
  resources :meetings

end
