Rails.application.routes.draw do

  resources :owners, only: [:new, :create, :edit, :update, :destroy]

  resources :developers do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]
  
    get '/about' => 'pages#about'
    get '/login' => 'sessions#new'
    get '/registerd' => 'developers#new'
    get '/registero' => 'owners#new'
    get '/logout' => 'session#destroy'

  resources :conversations do
  resources :messages
  end


resources :businesses

root to: "businesses#index"
    

  resources :photos, only: [:new, :create, :destroy]

end
