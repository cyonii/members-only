Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :members, controllers: { 'registrations': 'registrations' }
  root 'posts#index'
  resources :posts, only: [:new, :create, :index]
end
