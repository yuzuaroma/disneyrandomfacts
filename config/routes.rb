Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'yuzus/top' => 'yuzus#top'
  resources :yuzus do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :perfumes
  resources :questions
  root 'yuzus#top'
end