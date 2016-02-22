Rails.application.routes.draw do

  resources :owners do
    resources :status_updates, only: [:new, :create, :edit, :update, :destroy]
  end

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

  resources :skills, only: [:create]

  resources :photos, only: [:new, :create, :destroy]

  get 'auth/:provider/callback' => "sessions#create"
  delete 'sign_out' => "sessions#destroy", as: 'sign_out'

end
