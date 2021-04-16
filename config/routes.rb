Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/about' => 'homes#about'
  root to: 'homes#top'
  resources :books
  resources :users
end

