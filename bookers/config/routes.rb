Rails.application.routes.draw do
  get 'users/show'
  get 'user/show' 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: "homes#top"
get "home/about", to: "homes#about"
resources :books, only: [:create, :index, :show, :edit, :update, :destroy]

resources :users, only: [:show, :index, :edit, :update]
end
