if Rails.env == "production"
  # with domain set, the browser expects the cookie to be set from the specified domain.
  Rails.application.config.session_store :cookie_store, key: "_authentication_app", domain: "tt-authentication-app-api.herokuapp.com"
else
  # since we are not setting the cookie from the heroku app in the development environment we want to remove
  # the domain portion.
  Rails.application.config.session_store :cookie_store, key: "_authentication_app"
end
