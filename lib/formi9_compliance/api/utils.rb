module Formi9Compliance
  class Api
    # Defines methods related to utils
    module Utils

      # Trigger an api call to verify access_token is valid.
      def get_access_token(options)
        post('login', options)
      end
    end
  end
end
