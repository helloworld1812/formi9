require 'faraday'

module FaradayMiddleWare
  class RaiseHttpException < Faraday::Middleware
    def initialize(app)
      super(app)
    end

    def call(env)
      @app.call(env).on_complete do |response|
        case response.status.to_i
        when 400
          raise Formi9Compliance::BadRequest.new(response)
        when 401
          raise Formi9Compliance::Unauthorized.new(response)
        when 404
          raise Formi9Compliance::NotFound.new(response)
        when 500
          raise Formi9Compliance::InternalServerError.new(response)
        when 502
          raise Formi9Compliance::BadGateway.new(response)
        when 503
          raise Formi9Compliance::ServiceUnavailable.new(response)
        when 504
          raise Formi9Compliance::GatewayTimeout.new(response)
        end
      end
    end
  end
end
