Rails.application.routes.draw do
  devise_for :users

  authenticated :user, ->(user) { user.owner? } do
    get 'owner', to: 'owner#dashboard'
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :restaurants do
    resources :queuers, only: [ :new, :create, :edit, :update ]
    resources :reviews, only: [ :new, :create, :index ]
  end

  resources :queuers do
    resources :queuers, only: [ :show, :index, :destroy, :update ]
    member do
      patch :change_status
      delete :remove_queuer
      delete :quick_remove
    end
  end
end
