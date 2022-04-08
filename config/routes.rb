Rails.application.routes.draw do
  root 'cycles#index'
  resources :cycles, only: %i[index new create] do
    resources :invites, only: %i[new create]
  end
end
