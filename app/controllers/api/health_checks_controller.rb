class Api::HealthChecksController < Api::BaseController
  def index
    render json: { status: 200 }
  end
end
