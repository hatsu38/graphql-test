class ApplicationController < ActionController::Base
  # TODO: ApplicationControllerに書かずにApi::BaseControllerに書くだけにしたい
  protect_from_forgery with: :null_session, if: :devise_controller?
end
