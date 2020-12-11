module Formi9
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}


    include Formi9::Client::Companies
    include Formi9::Client::Eformi9
  end
end
