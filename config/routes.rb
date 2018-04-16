Rails.application.routes.draw do
  devise_for :users
  # resources :users, :only => [:show]
  get '/:id' => 'users#show'
  root to: "links#index"
  resources :links
end
