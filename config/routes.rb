Rails.application.routes.draw do

  resources :owners, only: [:new, :create, :edit, :update, :destroy] do
    resources :messages, only: [:index, :show, :new, :create, :destroy]
    get '/inbox' => 'messages#index'
  end

  resources :developers do
    resources :messages, only: [:index, :show, :new, :create, :destroy]
    get '/inbox' => 'messages#index'
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]
    get '/login' => 'sessions#new'
    get '/register' => 'users#new'
    get '/logout' => 'session#destroy'


resources :businesses

root to: "businesses#index"


end
