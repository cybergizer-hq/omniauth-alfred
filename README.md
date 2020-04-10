# omniauth-alfred

This gem contains the Alfred strategy for OmniAuth.

## Getting Started

### Installation

    gem "omniauth-alfred"

### Basic Usage

1. Tell OmniAuth about this provider. For a Rails app, your config/initializers/omniauth.rb file should look like this:
  ```
  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :alfred, "API_KEY", "API_SECRET"
  end
  ```

2. Add a callback route
  ```
  get '/auth/:provider/callback', to: 'sessions#create'
  ```
