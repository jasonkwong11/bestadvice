Rails.application.routes.draw do
  devise_for :users
  get '/posts/new', to: 'posts#new', as: :new
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :posts
end
