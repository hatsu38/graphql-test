Rails.application.routes.draw do
  mount_devise_token_auth_for 'EmployeeAuthentication', at: 'authenticate'
  if Rails.env.development?
    post "/graphql", to: "graphql#execute"
  end
  namespace :api do
    resources :health_checks, only: :index
  end
end
