begin
  require 'simplecov'
rescue LoadError
  # ignore
else
  SimpleCov.start do
    add_group 'Formi9', 'lib/formi9'
    add_group 'Faraday Middleware', 'lib/faraday'
    add_group 'Specs', 'spec'
  end
end

require File.expand_path('../../lib/formi9', __FILE__)

require 'rspec'
require 'webmock/rspec'
require 'pry'

RSpec.configure do |config|
  config.include WebMock::API
end

def capture_output(&block)
  begin
    old_stdout = $stdout
    $stdout = StringIO.new
    block.call
    result = $stdout.string
  ensure
    $stdout = old_stdout
  end
  result
end

def a_delete(path)
  a_request(:delete, Formi9.endpoint + path)
end

def a_get(path)
  a_request(:get, Formi9.endpoint + path)
end

def a_post(path)
  a_request(:post, Formi9.endpoint + path)
end

def a_put(path)
  a_request(:put, Formi9.endpoint + path)
end

def stub_delete(path)
  stub_request(:delete, Formi9.endpoint + path)
end

def stub_get(path)
  stub_request(:get, Formi9.endpoint + path)
end

def stub_post(path)
  stub_request(:post, Formi9.endpoint + path)
end

def stub_put(path)
  stub_request(:put, Formi9.endpoint + path)
end

def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file)
end


# Set up Rails cache for testing
require 'rails'
Rails.cache = ActiveSupport::Cache.lookup_store(:memory_store)
