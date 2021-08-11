module AeriesApi
  class Client
    module Schools
      def school(school_code:)
        response = self.class.get("/schools/#{school_code}")
        @error_handler.handle_error(response)
        mash_and_underscore_keys(response.parsed_response)
      end

      def schools
        response = self.class.get('/schools')
        @error_handler.handle_error(response)
        mash_and_underscore_keys(response.parsed_response)
      end
    end
  end
end
