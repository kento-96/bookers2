Rails.application.routes.draw do
  get 'chats/show'
  get "home/about"=>"homes#about"
  devise_for :users,controllers: {
  registrations: "users/registrations"
 }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  resources :books do
   resources :book_comments, only: [:create, :destroy]
   resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'

  end

  get "search"=>"searches#search"
  
  get "chat/:id" => "chats#show",as:"chat"
  resources :chats,only: [:create]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

end
