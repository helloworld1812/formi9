require File.expand_path('../spec_helper', __FILE__)

describe Formi9 do
  after do
    Formi9.reset
  end

  context "when delegating to a client" do
    before do
      stub_get("companies/acm_company").
        to_return(:body => fixture("acm_company.json"), :headers => {:content_type => "application/json; charset=utf-8"})

      response = {
        accessToken: SecureRandom.hex,
        expirationDateUtc: (Time.now + 1.week).utc.iso8601
      }.to_json

      stub_post("login").
        to_return(:body => response, :headers => {:content_type => "application/json; charset=utf-8"})
    end

    it "should return the same result as a client" do
      response1 = Formi9.get_company_info('acm_company').body
      response2 = Formi9::Client.new.get_company_info('acm_company').body
      expect(response1['clientCompanyWSId']).to eq(response2['clientCompanyWSId'])
    end

  end

  describe ".client" do
    it "should be a Formi9::Client" do
      expect(Formi9.client.is_a?(Formi9::Client)).to be true
    end
  end

  describe ".adapter" do
    it "should return the default adapter" do
      expect(Formi9.adapter).to eq(Formi9::Configuration::DEFAULT_ADAPTER)
    end
  end

  describe ".adapter=" do
    it "should set the adapter" do
      Formi9.adapter = :typhoeus
      expect(Formi9.adapter).to eq(:typhoeus)
    end
  end

  describe ".endpoint" do
    it "should return the default endpoint" do
      expect(Formi9.endpoint).to eq(Formi9::Configuration::DEFAULT_ENDPOINT)
    end
  end

  describe ".endpoint=" do
    it "should set the endpoint" do
      Formi9.endpoint = 'http://google.com'
      expect(Formi9.endpoint).to eq('http://google.com')
    end
  end

  describe ".user_agent" do
    it "should return the default user agent" do
      expect(Formi9.user_agent).to eq(Formi9::Configuration::DEFAULT_USER_AGENT)
    end
  end

  describe ".user_agent=" do
    it "should set the user_agent" do
      Formi9.user_agent = 'Custom User Agent - Bot'
      expect(Formi9.user_agent).to eq('Custom User Agent - Bot')
    end
  end

  describe ".configure" do
    Formi9::Configuration::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        Formi9.configure do |config|
          config.send("#{key}=", key)
          expect(Formi9.send(key)).to eq(key)
        end
      end
    end
  end
end
