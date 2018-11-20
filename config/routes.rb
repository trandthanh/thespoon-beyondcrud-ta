Rails.application.routes.draw do
  resources :restaurants do
    collection do
      get 'top', to: "restaurants#top"
    end
    member do
      get 'chef', to: "restaurants#chef"
    end
    resources :reviews, only: [ :index, :new, :create ]
  end

  resources :reviews, only: [ :show, :edit, :update, :destroy]

  namespace :admin do
    resources :restaurants, only: [:index]
  end
end
