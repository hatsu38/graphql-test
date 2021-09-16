require "rails_helper"

RSpec.describe Api::HealthChecksController, type: :request do
  describe "#index" do
    it "200になること" do
      get api_health_checks_path
      expect(response).to have_http_status(:ok)
    end
  end
end
