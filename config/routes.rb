Rails.application.routes.draw do
  resources :users
  root "home#show"
end
