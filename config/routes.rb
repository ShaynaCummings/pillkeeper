Pillkeeper::Application.routes.draw do
  root to: "static#index"
  devise_for :users
  resources :meds
  resources :users, {only: [ :show ]}
  #get "/meds", to: "meds#index", as: "user_root"
  match "meds", to: "meds#index", via: "get"
  

   # devise_scope :user do
   #    resources :users
   # end

end
