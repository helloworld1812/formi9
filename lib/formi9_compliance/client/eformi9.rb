module Formi9Compliance
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

      def case_status(result_id, auto_login_link=false)
        get("eformi9/status?request.resultId=#{result_id}&request.generateAutoLoginUrl=#{auto_login_link}")
      end

      def download_pdf(result_id, options={})
        params = []
        params << 'printSignatures=true' unless options[:print_signatures]
        params << 'printNotes=true' unless options[:print_notes]
        params << 'printEVerify=true' unless options[:print_everify]
        params << 'printDocs=true' unless options[:print_docs]
        params << 'printAuditTrail=true' unless options[:print_audit_trail]

        get("eformi9/#{result_id}/pdf?#{params.join('&')}")
      end
    end
  end
end
