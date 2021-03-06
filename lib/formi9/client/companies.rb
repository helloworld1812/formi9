module Formi9
  class Client
    # Defines methods related to companies
    module Companies

      # Get company settings, if there are no settings saved, anempty response if given.
      def get_company_info(company_id)
        get("companies/#{company_id}")
      end

      def create_company_with_mou(options)
        post('companies/mou', options)
      end
    end
  end
end
