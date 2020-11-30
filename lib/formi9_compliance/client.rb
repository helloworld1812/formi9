module Instagram
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}


    include Formi9Compliance::Client::Companies
    include Formi9Compliance::Client::Eformi9
  end
end
