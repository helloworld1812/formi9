module Formi9
  class Client
    # Defines methods related to formi9
    module Eformi9
      def create_section1(options={})
        post('eformi9/section1', options)
      end

      def update_section1(options={})
        post('eformi9/section1', options)
      end

      def create_section2(options={})
        post('eformi9/section2', options)
      end

      def case_status(result_id, options={})
        get("eformi9/status?request.resultId=#{result_id}&request.generateAutoLoginUrl=#{!!options[:auto_login_url]}")
      end

      def download_pdf(result_id, options={})
        options = options.with_indifferent_access
        params = []
        [:printSignatures, :printNotes, :printEVerify, :printDocs, :printAuditTrail].each do |key|
          params << "#{key}=true" if options[:key]
        end
        get("eformi9/#{result_id}/pdf?#{params.join('&')}")
      end
    end
  end
end
