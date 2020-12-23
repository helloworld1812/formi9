require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module Formi9
  module Connection

    private

    def connection
      options = {
        headers: {
          "Accept" => "application/#{format}; charset=utf-8",
          "User-Agent" => Formi9.user_agent,
        },
        proxy: proxy,
        url: endpoint
      }.merge(connection_options)

      Faraday::Connection.new(options) do |conn|
        conn.authorization :Bearer, access_token
        # https://github.com/lostisland/faraday/issues/417#issuecomment-223413386
        conn.options[:timeout] = timeout 
        conn.options[:open_timeout] = open_timeout 
        conn.request :json

        conn.use FaradayMiddleWare::RaiseFormi9HttpException
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
      end
    end
  end
end

