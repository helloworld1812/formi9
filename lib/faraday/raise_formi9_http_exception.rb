require 'faraday'

module FaradayMiddleWare
  class RaiseFormi9HttpException < Faraday::Middleware
    def initialize(app)
      super(app)
    end

    def call(env)
      @app.call(env).on_complete do |response|
        case response.status.to_i
        when 400
          raise Formi9::BadRequest.new(response)
        when 401
          raise Formi9::Unauthorized.new(response)
        when 404
          raise Formi9::NotFound.new(response)
        when 500
          raise Formi9::InternalServerError.new(response)
        when 502
          raise Formi9::BadGateway.new(response)
        when 503
          raise Formi9::ServiceUnavailable.new(response)
        when 504
          raise Formi9::GatewayTimeout.new(response)
        end
      end
    end
  end
end
