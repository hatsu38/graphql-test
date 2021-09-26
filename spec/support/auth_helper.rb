module AuthHelper
  def with_auth_header(user)
    user.create_new_auth_token
  end
end
