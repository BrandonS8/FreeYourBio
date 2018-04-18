Rails.application.routes.draw do
  root to: "pages#index"
  devise_for :users, controllers: { registrations: "registrations" }
  resources :users do
    resources :links
    resources :settings
  end
  get "/:id" => "users#show", :as => :user_profile
end
