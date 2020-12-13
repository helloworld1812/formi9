require 'active_support/core_ext/string/conversions'

module Formi9
  module OAuth
    def access_token
      token = Rails.cache.read(access_token_cache_key)

      if token.present?
        return token
      else
        reset_token
        Rails.cache.read(access_token_cache_key)
      end
    end

    def reset_token
      response = Faraday.post(endpoint + 'login', {id: partner_id, username: username, password: password})
      raise CredentialAreInvalid.new('Credentials are missing or invalid.') if response.status != 200
      body = JSON.parse(response.body)
      if Rails.cache.read(access_token_cache_key).nil?
        Rails.cache.write(access_token_cache_key, body['accessToken'], expires_in: token_cache_duration(body['expirationDateUtc']))
      end
    end

    def access_token_cache_key
      Digest::MD5.hexdigest([partner_id, username, password].join)
    end

    def token_cache_duration(timestamp)
      max = 6.days.to_i
      duration = timestamp.to_datetime.utc - Time.now
      duration > max ? max : duration
    end
  end
end
