Rails.application.routes.draw do
  root "home#show"

  namespace :api do
    namespace :v1 do
      resources :memos, only: %i[index create show update destroy]
    end
  end
end
