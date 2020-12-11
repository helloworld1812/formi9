module Formi9
  # Part1 API error
  # Custom error class for rescuing from all formi9.com errors
    class Error < StandardError
      attr_reader :http_method, :url, :errors

      def initialize(response)
        super
        @response = response.dup
        @http_method = response.method.to_s
        @url = response.url
      end

      def message
        <<-HEREDOC
      URL: #{@response.url}
      method: #{@response.method}
      response status: #{@response.status}
      response body: #{@response.response.body}
        HEREDOC
      end
    end

    # Raised when formi9.com returns the HTTP status code 400
    class BadRequest < Error; end

    # Raised when formi9.com returns the HTTP status code 401
    class Unauthorized < Error; end

    # Raised when formi9.com returns the HTTP status code 404
    class NotFound < Error; end

    # Raised when formi9.com returns the HTTP status code 500
    class InternalServerError < Error; end

    # Raised when formi9.com returns the HTTP status code 502
    class BadGateway < Error; end

    # Raised when formi9.com returns the HTTP status code 503
    class ServiceUnavailable < Error; end

    # Raised when formi9.com returns the HTTP status code 504
    class GatewayTimeout < Error; end


  # Part2 Non-API error
  # Raised when client fails to provide required parameters.
  class MissingRequiredArgument < StandardError; end

  # Raised when configuration is missing
  class MissingRequiredConfigurationt < StandardError; end

  # Invalid username or password
  class CredentialAreInvalid < StandardError; end
end
