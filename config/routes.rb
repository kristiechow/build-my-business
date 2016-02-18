Rails.application.routes.draw do

resources :users do
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
