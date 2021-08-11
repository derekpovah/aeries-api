module AeriesApi
  class Client
    module StudentGroups
      def student_groups(school_code:)
        response = self.class.get("/schools/#{school_code}/studentgroups")
        @error_handler.handle_error(response)
        mash_and_underscore_keys(response.parsed_response)
      end
    end
  end
end
