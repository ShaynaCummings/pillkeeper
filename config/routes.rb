Pillkeeper::Application.routes.draw do
  root to: "static#index"
  devise_for :users
  resources :meds
  resources :users, only: [:edit, :show, :update]
  get "/meds", to: "meds#index", as: "user_root"
  get "/forthcoming", to: "static#forthcoming"
  

end
