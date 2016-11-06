Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :posts do 
    resources :comments
  end

  post '/posts/upvote', to: 'posts#upvote'
  post '/posts/downvote', to: 'posts#downvote'

 # get '/posts/new', to: 'posts#new', as: :new
end
