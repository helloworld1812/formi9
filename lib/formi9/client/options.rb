module Formi9
  class Client
    # Defines methods related to Options
    module Options
      # Get company option by option name.
      def get_company_option(company_id, option_name)
        get("companies/#{company_id}/options/#{option_name}").body
      end

      # Create or update a option for a specific company
      def update_company_option(company_id, option_name, payload={})
        put("companies/#{company_id}/options/#{option_name}", payload)
      end

      # Get enabled options of specific company
      def get_company_active_options(company_id)
        get("companies/#{company_id}/options/active").body
      end
    end
  end
end
