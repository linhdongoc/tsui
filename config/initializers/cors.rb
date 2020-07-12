Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'

    resource '*',
             headers: :any,
             credentials: false,
             expose: %w[x-user-email x-user-token Link Total Per-Page Content-Type Accept],
             methods: [:get, :post, :put, :patch, :delete, :options, :head]
   end
end
