Rails.application.routes.draw do
  if Rails.env.development?
    post '/graphql', to: 'graphql#execute'
  end
  namespace :api do
    resources :health_checks, only: :index
  end
end
