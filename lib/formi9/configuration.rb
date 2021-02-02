require 'faraday'
require 'openssl'
require File.expand_path('../version', __FILE__)

module Formi9
# Defines constants and methods related to configuration
  module Configuration
    # An array of valid keys in the options hash when configuring a {Formi9::API}
    VALID_OPTIONS_KEYS = [
      :partner_id, 
      :username,
      :password,
      :adapter,
      :connection_options,
      :host,
      :endpoint,
      :format,
      :proxy,
      :user_agent,
      :per_page,
      :timeout,
      :open_timeout,
      :b2b_encryption_algorithm,
      :b2b_encryption_cipher_mode,
      :b2b_encryption_key,
      :b2b_encryption_iv,
    ].freeze

    # By default, don't set an access token
    DEFAULT_ACCESS_TOKEN = nil

    # By default, return 20 resources per page when there is an pagination.
    DEFAULT_PER_PAGE = 20

    # The adapter that will be used to connect if none is set
    #
    # @note The default faraday adapter is Net::HTTP.
    DEFAULT_ADAPTER = Faraday.default_adapter

    # By default, don't set connection options.
    DEFAULT_CONNECTION_OPTIONS = {}

    # Default timeout time is 20 seconds
    DEFAULT_TIMEOUT = 20

    # By default, the open timeout is 20 seconds.
    DEFAULT_OPEN_TIMEOUT = 20

    # The endpoint that will be used to connect if none is set
    DEFAULT_ENDPOINT = 'https://www.formi9.com/FormI9Api/partner/v2.0/'.freeze

    # The response format appended to the path and sent in the 'Accept' header if none is set
    #
    # @note JSON is the only available format at this time
    DEFAULT_FORMAT = :json

    DEFAULT_B2B_ENCRYPTION_ALGORITHM = OpenSSL::Cipher::AES256

    DEFAULT_B2B_ENCRYPTION_CIPHER_MODE = :CBC

    # By default, don't use a proxy server
    DEFAULT_PROXY = nil

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "formi9.com Ruby Gem #{Formi9::VERSION}".freeze

    # An array of valid request/response formats
    VALID_FORMATS = [:json].freeze

    # @private
    attr_accessor *VALID_OPTIONS_KEYS

    # When this module is extended, set all configuration options to their default values
    def self.extended(base)
      base.reset
    end

    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

    # Create a hash of options and their values
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    # Reset all configuration options to defaults
    def reset
      self.adapter            = DEFAULT_ADAPTER
      self.connection_options = DEFAULT_CONNECTION_OPTIONS
      self.endpoint           = DEFAULT_ENDPOINT
      self.format             = DEFAULT_FORMAT
      self.proxy              = DEFAULT_PROXY
      self.user_agent         = DEFAULT_USER_AGENT
      self.per_page           = DEFAULT_PER_PAGE
      self.timeout            = DEFAULT_TIMEOUT
      self.open_timeout       = DEFAULT_OPEN_TIMEOUT
      self.b2b_encryption_algorithm   = DEFAULT_B2B_ENCRYPTION_ALGORITHM
      self.b2b_encryption_cipher_mode = DEFAULT_B2B_ENCRYPTION_CIPHER_MODE
    end
  end
end
