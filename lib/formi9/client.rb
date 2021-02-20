module Formi9
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}


    include Formi9::Client::Companies
    include Formi9::Client::Eformi9
    include Formi9::Client::B2b
    include Formi9::Client::Options
    include Formi9::Client::Services
  end
end
