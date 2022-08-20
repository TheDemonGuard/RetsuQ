Rails.application.routes.draw do
  authenticated :user, ->(user) { user.owner? } do
    get 'owner', to: 'owner#dashboard'
  end

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :restaurants do
    resources :queuers, only: [ :new, :create, :edit, :update ]
    resources :reviews, only: [ :new, :create, :index ]
    member do
      get :recommended_restaurants
    end
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
