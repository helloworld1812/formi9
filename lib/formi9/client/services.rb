module Formi9
  class Client
    # Defines methods related to Services
    module Services
      # Add a service for a company
      def create_company_service(company_id, service_name)
        post("companies/#{company_id}/services/#{service_name}")
      end

      # Get all services of a company.
      def get_company_services(company_id)
        get("companies/#{company_id}/services").body
      end
    end
  end
end
