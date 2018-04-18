Rails.application.routes.draw do
  root to: "pages#index"
  devise_for :users, controllers: {registrations: "registrations"}
  resources :users do
    resources :links
  end
  get "/:id" => "users#show", :as => :user_profile
  get "/:id/settings/edit" => "settings#edit", :as => :user_settings_edit
  put "/:id/settings" => "settings#update", :as => :user_settings
end
