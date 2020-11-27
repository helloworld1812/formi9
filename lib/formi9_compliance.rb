require File.expand_path('../formi9_compliance/connection', __FILE__)
require File.expand_path('../formi9_compliance/request', __FILE__)
require File.expand_path('../formi9_compliance/error', __FILE__)

Dir[File.expand_path('../formi9_compliance/api/*.rb', __FILE__)].each{ |f| require f }

class Formi9Compliance
  extend Configuration
  extend Connection
  extend Request

  extend Formi9Compliance::Api::Companies
  extend Formi9Compliance::Api::Eformi9
  extend Formi9Compliance::Api::Utils

end