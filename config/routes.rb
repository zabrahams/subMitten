Rails.application.routes.draw do

  root "static_pages#root"

  resources :poems
  resources :journals
  resources :submissions do
    get 'acceptance', on: :member
  end
  resources :notes, only: [:create, :destroy]
end
