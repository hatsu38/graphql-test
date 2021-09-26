namespace :api, format: "json" do
  mount_devise_token_auth_for "EmployeeAuthentication", at: "authenticate"
  resources :health_checks, only: :index

  resource :profile, only: :show

  namespace :employee do
    resources :invites, only: [:create, :update]
  end
  # エラーハンドリング
  get "*anything" => "errors#not_found"
end
