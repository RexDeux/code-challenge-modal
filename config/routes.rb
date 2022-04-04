Rails.application.routes.draw do
  root 'cycles#index'
  resources :invites, only: %i[new create]
  resources :cycles
end
