Rails.application.routes.draw do
  devise_for :users #順番を上にした
  
  root 'homes#top'
  get 'home/about' => 'homes#about', as: 'about'
  
  resources :users, only: [:show,:index,:edit,:update]
  resources :books do
    resources :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
end