Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    registrations: 'public/users/registrations'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
    get 'mypage', to: 'users#mypage'
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
  end
end
