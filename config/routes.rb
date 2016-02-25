Rails.application.routes.draw do

  resources :owners

  resources :developers do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]

    get '/about' => 'pages#about'
    get '/help' => 'pages#help'
    get '/login' => 'sessions#new'
    get '/registerd' => 'developers#new'
    get '/registero' => 'owners#new'
    get '/logout' => 'session#destroy'

  resources :conversations do
  resources :messages
  end

  resources :businesses do
    resources :status_updates, only: [:new, :create, :edit, :update, :destroy]
  end

  put 'done/:id' => "businesses#done"

  root to: "businesses#index"

  resources :skills, only: [:create]

  resources :photos, only: [:new, :create, :destroy]

  get 'auth/:provider/callback' => "sessions#create"
  delete 'sign_out' => "sessions#destroy", as: 'sign_out'

  resources :matches do
   member do
    get 'request_accept'
    delete 'request_reject'
   end
  end

  get 'developers/:id/projects' => 'developers#projects'
  get 'businesses/:id/complete' => 'businesses#complete'

  get "progress" => "pages#progress"

end
