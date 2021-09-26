module Api::ErrorsHandler
  extend ActiveSupport::Concern

  included do
    unless Rails.env.development?
      rescue_from StandardError, with: :rescue_internal_server_error
      rescue_from ActionController::RoutingError, with: :rescue_not_found
      rescue_from ActionView::MissingTemplate, with: :rescue_not_found
      rescue_from ActionController::UnknownFormat, with: :rescue_not_found
      rescue_from ActiveRecord::RecordNotFound, with: :rescue_not_found
    end
  end

  private

  def rescue_not_found(err)
    render json: { message: err }, status: :not_found
  end

  def rescue_internal_server_error(err)
    render json: { message: err }, status: :internal_server_error
  end
end
