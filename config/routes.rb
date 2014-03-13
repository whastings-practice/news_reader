NewReader::Application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :feeds, only: [:index, :create, :show] do
    resources :entries, only: [:index]
    member do
      patch 'favorite', to: 'feeds#favorite'
    end
  end

  resources :entries, only: [:show]

  root to: "feeds#index"
end
