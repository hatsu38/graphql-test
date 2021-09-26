class Api::ErrorsController < Api::BaseController
  def not_found
    raise ActionController::RoutingError, "pathが正しくありません"
  end
end
