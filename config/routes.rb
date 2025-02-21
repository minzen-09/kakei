Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'public/users/sessions',
    registrations: 'public/users/registrations'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about', to: 'homes#about'
  end

  namespace :admin do
  end
end
