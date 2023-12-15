Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://app-deployment--hilarious-travesseiro-84c608.netlify.app'
    resource(
      '*',
      headers: :any,
      expose: ['access-token', 'expiry', 'token-type', 'Authorization'],
      methods: [:get, :patch, :put, :delete, :post, :options, :show]
    )
  end
end