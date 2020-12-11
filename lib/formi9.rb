require File.expand_path('../formi9/error', __FILE__)
require File.expand_path('../formi9/configuration', __FILE__)
require File.expand_path('../formi9/api', __FILE__)
require File.expand_path('../formi9/client', __FILE__)

module Formi9
  extend Configuration

  # Alias for Formi9::Client.new
  #
  # @return [Formi9::Client]
  def self.client(options={})
    Formi9::Client.new(options)
  end

  # Delegate to Formi9::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end

  # Delegate to Formi9::Client
  def self.respond_to?(method, include_all=false)
    return client.respond_to?(method, include_all) || super
  end
end
