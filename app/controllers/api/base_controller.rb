class Api::BaseController < ApplicationController
  include Api::ErrorsHandler
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :null_session
end
