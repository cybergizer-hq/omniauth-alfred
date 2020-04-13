require 'omniauth-oauth2'
require 'json'

module OmniAuth
  module Strategies
    class Alfred < OmniAuth::Strategies::OAuth2
      begin
        require 'dotenv' unless defined?(ENV)

        ALFRED_APP_URL = ENV.fetch('ALFRED_APP_URL', 'https://alfred-cg.herokuapp.com')
      rescue LoadError
        ALFRED_APP_URL = 'https://alfred-cg.herokuapp.com'
      end

      option :name, :alfred

      option :client_options,
             site: ALFRED_APP_URL,
             authorize_path: '/oauth/authorize'

      uid do
        raw_info['uid']
      end

      info do
        {
          email: raw_info['email'],
          alfred_id: raw_info['id'],
          first_name: raw_info['first_name'],
          last_name: raw_info['last_name'],
          name: "#{raw_info['first_name']} #{raw_info['last_name']}",
          avatar_url: raw_info['avatar'],
          dob: raw_info['dob']
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/users/me.json').parsed
      end
    end
  end
end
