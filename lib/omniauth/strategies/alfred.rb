require 'omniauth-oauth2'
require 'json'

module OmniAuth
  module Strategies
    class Alfred < OmniAuth::Strategies::OAuth
      option :name, :alfred

      option :client_options,
             site: 'http://localhost:3000',
             authorize_path: '/oauth/authorize'

      uid do
        raw_info["id"]
      end

      info do
        {
          email: raw_info["email"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/user/info.json').parsed
      end
    end
  end
end
