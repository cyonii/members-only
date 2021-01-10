Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { 'registrations': 'registrations' }
  root 'application#index'
  resources :forums do
    resources :posts, except: [:index] do
      resources :comments, only: %i[create destroy]
    end
  end
end
