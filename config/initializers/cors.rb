# white list certain domains.
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  # don't allow outside domains (not white-listed) to access our system.
  allow do
    origins "http://localhost:3000"
    resource "*", headers: :any, methods: [:get, :post, :patch, :put, :delete, :options, :head], credentials: true # allow headers to be passed back in forth such as passing the cookie between the back end and front end.
  end

  allow do
    origins "https://tt-authentication-app-react.herokuapp.com/"
    resource "*", headers: :any, methods: [:get, :post, :patch, :put, :delete, :options, :head], credentials: true # allow headers to be passed back in forth such as passing the cookie between the back end and front end.
  end
end
