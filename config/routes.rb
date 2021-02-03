Rails.application.routes.draw do
  resources :users, only: %i[new create show edit update]
end
