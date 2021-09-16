Rails.application.routes.draw do
  namespace :api do
    resources :health_checks, only: :index
  end
end
