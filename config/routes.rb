Rails.application.routes.draw do

  devise_for :admins, path: "admin", controllers: {
    sessions: 'admin/admins/sessions'
  }
  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    registrations: 'public/users/registrations'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
    get 'mypage', to: 'users#mypage'
    post 'guest_login', to: 'users#guest_login'
    get 'search', to: 'searches#search'
    resources :users, only: [:show, :edit, :update, :destroy] do
      resource :relationships, only: [:create, :destroy]
      member do
        get :favorites
        get :followings
        get :followers
      end
    end
    resources :budgets, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :posts do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create]
    end
    resources :comments, only: [:destroy]
  end

  namespace :admin do
    root to: 'users#index'
    get 'search', to: 'searches#search'
    resources :users, only: [:index, :show, :destroy]
    resources :posts, only: [:index, :show, :destroy]
    resources :comments, only: [:index, :destroy] 
  end
end
