module Formi9Compliance
  module OAuth
    def token_cache_key
      Digest::MD5.hexdigest([partner_id, username, password].join)
    end

    def access_token
      token = Rails.cache.read(cache_key)

      if token.present?
        return token
      else
        reset_token
        return Rails.cache.read(cache_key)
      end
    end


    def reset_token
      if token.nil? || token['']
        response = post('login', {id: partner_id, username: username, password: password})

        # double check to avoid race condition
        Rails.cache.write(response['token'])   if Rails.cache.read(cache_key).nil? 
      end
    end
  end
end