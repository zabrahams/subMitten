Rails.application.routes.draw do

  root "static_pages#root"

  resources :poems
  resources :journals

end
