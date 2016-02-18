Rails.application.routes.draw do

  resources :owners, only: [:new, :create, :edit, :update, :destroy]

  resources :developers do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]
    get '/login' => 'sessions#new'
    get '/register' => 'users#new'
    get '/logout' => 'session#destroy'


  resources :conversations do
  resources :messages
  end


resources :businesses

root to: "businesses#index"


end
