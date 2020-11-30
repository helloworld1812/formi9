require File.expand_path('../formi9_compliance/error', __FILE__)
require File.expand_path('../formi9_compliance/configuration', __FILE__)
require File.expand_path('../formi9_compliance/api', __FILE__)
require File.expand_path('../formi9_compliance/client', __FILE__)
require File.expand_path('../formi9_compliance/response', __FILE__)

module Formi9Compliance
  extend Configuration

  # Alias for Formi9Compliance::Client.new
  #
  # @return [Formi9Compliance::Client]
  def self.client(options={})
    Formi9Compliance::Client.new(options)
  end

  # Delegate to Formi9Compliance::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Formi9Compliance::Client
  def self.respond_to?(method, include_all=false)
    return client.respond_to?(method, include_all) || super
  end
end
