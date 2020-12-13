require File.expand_path('../../spec_helper', __FILE__)

describe Formi9::OAuth do
  describe '#access_token' do
    it 'should read token from cache' do
      response = {
        accessToken: 'abcdefghijklmn',
        expirationDateUtc: (Time.now + 1.week).utc.iso8601
      }.to_json

      stub_post("login").
        to_return(:body => response, :headers => {:content_type => "application/json; charset=utf-8"})


      client = Formi9::Client.new(
        partner_id: 'acm_company',
        username: 'acm',
        password: '3G6£!)d1Oi$&U43w9@h*'
      )
      client.access_token
      expect(Rails.cache.read(client.access_token_cache_key)).to eq('abcdefghijklmn')
    end
  end

  describe '#reset_token' do

  end

  describe '#access_token_cache_key' do
    it 'should be changed when password, username, or partner_id has been changed' do
      [:partner_id, :username, :password].each do |key|
        client = Formi9::Client.new(
          partner_id: 'acm_company',
          username: 'acm',
          password: '3G6£!)d1Oi$&U43w9@h*'
        )

        key1 = client.access_token_cache_key

        # change the partner_id, username, password
        client.send("#{key}=", 'new_value')
        key2 = client.access_token_cache_key

        # the access token cache key should be changed
        expect(key1 != key2).to be true
      end
    end


    it 'should be changed when password has been changed' do
      Formi9.configure do |config|
        config.partner_id = 'acm_company'
        config.username = 'acm'
        config.password = '3G6£!)d1Oi$&U43w9@h*'
      end
      old_key = Formi9.access_token_cache_key

      # change the partner_id, username, password
      [:partner_id, :username, :password].each do |key|
        Formi9.send("#{key}=", 'new_value')
        new_key = Formi9.access_token_cache_key

        # the access token cache key should be changed
        expect(old_key != new_key).to be true
      end
    end

    it 'should share same access_token when password, username, and partner_id are identical' do
      client1 = Formi9::Client.new(
        partner_id: 'acm_company',
        username: 'acm',
        password: '3G6£!)d1Oi$&U43w9@h*'
      )

      client2 = Formi9::Client.new(
        partner_id: 'acm_company',
        username: 'acm',
        password: '3G6£!)d1Oi$&U43w9@h*'
      )

      expect(client1.access_token_cache_key).to eq(client2.access_token_cache_key)
    end
  end


  describe '#token_cache_duration' do

  end
end
