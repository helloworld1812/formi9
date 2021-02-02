require "base64"
require 'openssl'
require 'faraday'

module Formi9
  class Client
    module B2b
      
      # options = {
      #   b2b_username: 'Ryan Lyu'
      #   company_id: 'workstreamdemo',
      #   request_id: 'AUniqueId',
      #   result_id: 'AUniqueId'
      # }
      def b2b_direct_link(options)
        string = "AlliancePartnerID=#{CGI.escape(partner_id)}"
        string << "&AlliancePartnerLogin=#{CGI.escape(username)}"
        string << "&AlliancePartnerPassword=#{CGI.escape(password)}"
        string << "&AlliancePartnerCompanyID=#{CGI.escape(options[:company_id])}"
        string << "&Target=DirectLink&B2BUserName=#{CGI.escape(options[:b2b_username])}"
        string << "&RequestID=#{CGI.escape(options[:request_id])}"
        string << "&ResultID=#{CGI.escape(options[:result_id])}&"

        data = b2b_encrypt(string)

        "https://www.formi9.com/FormI9Verify/FormI9LoginService.aspx?EPID=#{partner_id}&EDATA=#{data}"
      end


      def b2b_encrypt(string)
        cipher = b2b_encryption_algorithm.new(b2b_encryption_cipher_mode) 
        cipher.encrypt
        cipher.key = b2b_encryption_key
        cipher.iv = b2b_encryption_iv
        encrypted_string = cipher.update(string)
        encrypted_string << cipher.final

        base64_string = Base64.strict_encode64(encrypted_string)
        escaped_data = CGI.escape(base64_string)
      end
    end
  end
end
