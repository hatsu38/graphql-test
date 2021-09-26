Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins Rails.env.production? ? "https://graphql-test.com" : "http://localhost:8080"

    resource "*",
             headers: :any,
             expose: %w[access-token client uid],
             methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
