Rails.application.routes.draw do
  devise_for :users
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/secret', to: 'posts#secret', as: :secret
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :posts
end
