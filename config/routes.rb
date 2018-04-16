Rails.application.routes.draw do
  root to: "pages#index"
  devise_for :users
  resources :users do
    resources :links
  end
  get "/:id" => "users#show", :as => :user_profile
end
