Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  root to: 'pages#home'

  resources :users do
    resources :chats, only: [ :index, :new, :create, :show, :update] do
      resources :messages, only: [ :index, :new, :create ]
    end
  end

end
